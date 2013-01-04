package com.guymoyo.web;

import com.guymoyo.domain.CategoryParis;
import com.guymoyo.domain.Equip;
import com.guymoyo.domain.Etat;
import com.guymoyo.domain.League;
import com.guymoyo.domain.Paris;
import com.guymoyo.domain.Rencontre;
import com.guymoyo.domain.SportType;
import com.guymoyo.domain.UserAccount;
import com.guymoyo.service.EquipService;
import com.guymoyo.service.LeagueService;
import com.guymoyo.service.RencontreService;
import com.guymoyo.service.SportTypeService;
import com.guymoyo.service.UserAccountService;
import com.guymoyo.web.converter.EquipConverter;
import com.guymoyo.web.converter.LeagueConverter;
import com.guymoyo.web.converter.SportTypeConverter;
import com.guymoyo.web.converter.UserAccountConverter;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.el.ELContext;
import javax.el.ExpressionFactory;
import javax.faces.application.Application;
import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.faces.component.html.HtmlOutputText;
import javax.faces.component.html.HtmlPanelGrid;
import javax.faces.context.FacesContext;
import javax.faces.convert.DateTimeConverter;
import org.primefaces.component.autocomplete.AutoComplete;
import org.primefaces.component.calendar.Calendar;
import org.primefaces.component.inputtext.InputText;
import org.primefaces.component.message.Message;
import org.primefaces.context.RequestContext;
import org.primefaces.event.CloseEvent;
import org.primefaces.event.RowEditEvent;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.roo.addon.jsf.managedbean.RooJsfManagedBean;
import org.springframework.roo.addon.serializable.RooSerializable;

@ManagedBean(name = "rencontreBean")
@SessionScoped
@RooSerializable
@RooJsfManagedBean(entity = Rencontre.class, beanName = "rencontreBean")
public class RencontreBean {

	@Autowired
    RencontreService rencontreService;

	@Autowired
    EquipService equipService;

	@Autowired
    SportTypeService sportTypeService;

	@Autowired
    LeagueService leagueService;

	@Autowired
    UserAccountService userAccountService;

	private String name = "Rencontres";

	private Rencontre rencontre;

	private List<Rencontre> allRencontres;

	private boolean dataVisible = false;

	private List<String> columns;

	private HtmlPanelGrid createPanelGrid;

	private HtmlPanelGrid editPanelGrid;

	private HtmlPanelGrid viewPanelGrid;

	private boolean createDialogVisible = false;
	
	private boolean parisDialogVisible = false;
	
	private List<Paris> paris;
	
	private List<Etat> etats;

	public List<Etat> getEtats() {
		 etats = new ArrayList<Etat>();
	        for (Etat etat : Etat.values()) {
	                etats.add(etat);
	        }
	        return etats;
	}

	public void setEtats(List<Etat> etats) {
		this.etats = etats;
	}

	public boolean isParisDialogVisible() {
		return parisDialogVisible;
	}

	public void setParisDialogVisible(boolean parisDialogVisible) {
		this.parisDialogVisible = parisDialogVisible;
	}

	public List<Paris> getParis() {
		return Paris.findParisesByRencontre(rencontre).getResultList();
	}

	public void setParis(List<Paris> paris) {
		this.paris = paris;
	}

	@PostConstruct
    public void init() {
        columns = new ArrayList<String>();
        columns.add("equipeA");
        columns.add("equipeB");
        columns.add("sporttype");
        columns.add("lieu");
        columns.add("rencontreDate");
    }

	public String getName() {
        return name;
    }

	public List<String> getColumns() {
        return columns;
    }

	public List<Rencontre> getAllRencontres() {
        return allRencontres;
    }

	public void setAllRencontres(List<Rencontre> allRencontres) {
        this.allRencontres = allRencontres;
    }

	public String findAllRencontres() {
        allRencontres = rencontreService.findAllRencontres();
        dataVisible = !allRencontres.isEmpty();
        return null;
    }

	public boolean isDataVisible() {
        return dataVisible;
    }

	public void setDataVisible(boolean dataVisible) {
        this.dataVisible = dataVisible;
    }

	public HtmlPanelGrid getCreatePanelGrid() {
        if (createPanelGrid == null) {
            createPanelGrid = populateCreatePanel();
        }
        return createPanelGrid;
    }

	public void setCreatePanelGrid(HtmlPanelGrid createPanelGrid) {
        this.createPanelGrid = createPanelGrid;
    }

	public HtmlPanelGrid getEditPanelGrid() {
        if (editPanelGrid == null) {
            editPanelGrid = populateEditPanel();
        }
        return editPanelGrid;
    }

	public void setEditPanelGrid(HtmlPanelGrid editPanelGrid) {
        this.editPanelGrid = editPanelGrid;
    }

	public HtmlPanelGrid getViewPanelGrid() {
        return populateViewPanel();
    }

	public void setViewPanelGrid(HtmlPanelGrid viewPanelGrid) {
        this.viewPanelGrid = viewPanelGrid;
    }

	public HtmlPanelGrid populateCreatePanel() {
        FacesContext facesContext = FacesContext.getCurrentInstance();
        Application application = facesContext.getApplication();
        ExpressionFactory expressionFactory = application.getExpressionFactory();
        ELContext elContext = facesContext.getELContext();
        
        HtmlPanelGrid htmlPanelGrid = (HtmlPanelGrid) application.createComponent(HtmlPanelGrid.COMPONENT_TYPE);
        
        HtmlOutputText equipeACreateOutput = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        equipeACreateOutput.setId("equipeACreateOutput");
        equipeACreateOutput.setValue("Equipe A:   ");
        htmlPanelGrid.getChildren().add(equipeACreateOutput);
        
        AutoComplete equipeACreateInput = (AutoComplete) application.createComponent(AutoComplete.COMPONENT_TYPE);
        equipeACreateInput.setId("equipeACreateInput");
        equipeACreateInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{rencontreBean.rencontre.equipeA}", Equip.class));
        equipeACreateInput.setCompleteMethod(expressionFactory.createMethodExpression(elContext, "#{rencontreBean.completeEquipeA}", List.class, new Class[] { String.class }));
        equipeACreateInput.setDropdown(true);
        equipeACreateInput.setValueExpression("var", expressionFactory.createValueExpression(elContext, "equipeA", String.class));
        equipeACreateInput.setValueExpression("itemLabel", expressionFactory.createValueExpression(elContext, "#{equipeA.name}", String.class));
        equipeACreateInput.setValueExpression("itemValue", expressionFactory.createValueExpression(elContext, "#{equipeA}", Equip.class));
        equipeACreateInput.setConverter(new EquipConverter());
        equipeACreateInput.setRequired(false);
        equipeACreateInput.setMaxResults(10);
        htmlPanelGrid.getChildren().add(equipeACreateInput);
        
        Message equipeACreateInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        equipeACreateInputMessage.setId("equipeACreateInputMessage");
        equipeACreateInputMessage.setFor("equipeACreateInput");
        equipeACreateInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(equipeACreateInputMessage);
        
        HtmlOutputText equipeBCreateOutput = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        equipeBCreateOutput.setId("equipeBCreateOutput");
        equipeBCreateOutput.setValue("Equipe B:   ");
        htmlPanelGrid.getChildren().add(equipeBCreateOutput);
        
        AutoComplete equipeBCreateInput = (AutoComplete) application.createComponent(AutoComplete.COMPONENT_TYPE);
        equipeBCreateInput.setId("equipeBCreateInput");
        equipeBCreateInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{rencontreBean.rencontre.equipeB}", Equip.class));
        equipeBCreateInput.setCompleteMethod(expressionFactory.createMethodExpression(elContext, "#{rencontreBean.completeEquipeB}", List.class, new Class[] { String.class }));
        equipeBCreateInput.setDropdown(true);
        equipeBCreateInput.setValueExpression("var", expressionFactory.createValueExpression(elContext, "equipeB", String.class));
        equipeBCreateInput.setValueExpression("itemLabel", expressionFactory.createValueExpression(elContext, "#{equipeB.name} #{equipeB.description}", String.class));
        equipeBCreateInput.setValueExpression("itemValue", expressionFactory.createValueExpression(elContext, "#{equipeB}", Equip.class));
        equipeBCreateInput.setConverter(new EquipConverter());
        equipeBCreateInput.setRequired(false);
        htmlPanelGrid.getChildren().add(equipeBCreateInput);
        
        Message equipeBCreateInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        equipeBCreateInputMessage.setId("equipeBCreateInputMessage");
        equipeBCreateInputMessage.setFor("equipeBCreateInput");
        equipeBCreateInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(equipeBCreateInputMessage);
        
        HtmlOutputText creationDateCreateOutput = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        creationDateCreateOutput.setId("creationDateCreateOutput");
        creationDateCreateOutput.setValue("Creation Date:   ");
        htmlPanelGrid.getChildren().add(creationDateCreateOutput);
        
        Calendar creationDateCreateInput = (Calendar) application.createComponent(Calendar.COMPONENT_TYPE);
        creationDateCreateInput.setId("creationDateCreateInput");
        creationDateCreateInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{rencontreBean.rencontre.creationDate}", Date.class));
        creationDateCreateInput.setNavigator(true);
        creationDateCreateInput.setEffect("slideDown");
        creationDateCreateInput.setPattern("dd/MM/yyyy");
        creationDateCreateInput.setRequired(false);
        htmlPanelGrid.getChildren().add(creationDateCreateInput);
        
        Message creationDateCreateInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        creationDateCreateInputMessage.setId("creationDateCreateInputMessage");
        creationDateCreateInputMessage.setFor("creationDateCreateInput");
        creationDateCreateInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(creationDateCreateInputMessage);
        
        HtmlOutputText lieuCreateOutput = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        lieuCreateOutput.setId("lieuCreateOutput");
        lieuCreateOutput.setValue("Lieu:   ");
        htmlPanelGrid.getChildren().add(lieuCreateOutput);
        
        InputText lieuCreateInput = (InputText) application.createComponent(InputText.COMPONENT_TYPE);
        lieuCreateInput.setId("lieuCreateInput");
        lieuCreateInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{rencontreBean.rencontre.lieu}", String.class));
        htmlPanelGrid.getChildren().add(lieuCreateInput);
        
        Message lieuCreateInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        lieuCreateInputMessage.setId("lieuCreateInputMessage");
        lieuCreateInputMessage.setFor("lieuCreateInput");
        lieuCreateInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(lieuCreateInputMessage);
        
        HtmlOutputText rencontreDateCreateOutput = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        rencontreDateCreateOutput.setId("rencontreDateCreateOutput");
        rencontreDateCreateOutput.setValue("Rencontre Date:   ");
        htmlPanelGrid.getChildren().add(rencontreDateCreateOutput);
        
        Calendar rencontreDateCreateInput = (Calendar) application.createComponent(Calendar.COMPONENT_TYPE);
        rencontreDateCreateInput.setId("rencontreDateCreateInput");
        rencontreDateCreateInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{rencontreBean.rencontre.rencontreDate}", Date.class));
        rencontreDateCreateInput.setNavigator(true);
        rencontreDateCreateInput.setEffect("slideDown");
        rencontreDateCreateInput.setPattern("dd/MM/yyyy");
        rencontreDateCreateInput.setRequired(false);
        htmlPanelGrid.getChildren().add(rencontreDateCreateInput);
        
        Message rencontreDateCreateInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        rencontreDateCreateInputMessage.setId("rencontreDateCreateInputMessage");
        rencontreDateCreateInputMessage.setFor("rencontreDateCreateInput");
        rencontreDateCreateInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(rencontreDateCreateInputMessage);
        
        HtmlOutputText sporttypeCreateOutput = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        sporttypeCreateOutput.setId("sporttypeCreateOutput");
        sporttypeCreateOutput.setValue("Sporttype:   ");
        htmlPanelGrid.getChildren().add(sporttypeCreateOutput);
        
        AutoComplete sporttypeCreateInput = (AutoComplete) application.createComponent(AutoComplete.COMPONENT_TYPE);
        sporttypeCreateInput.setId("sporttypeCreateInput");
        sporttypeCreateInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{rencontreBean.rencontre.sporttype}", SportType.class));
        sporttypeCreateInput.setCompleteMethod(expressionFactory.createMethodExpression(elContext, "#{rencontreBean.completeSporttype}", List.class, new Class[] { String.class }));
        sporttypeCreateInput.setDropdown(true);
        sporttypeCreateInput.setValueExpression("var", expressionFactory.createValueExpression(elContext, "sporttype", String.class));
        sporttypeCreateInput.setValueExpression("itemLabel", expressionFactory.createValueExpression(elContext, "#{sporttype.name} #{sporttype.description}", String.class));
        sporttypeCreateInput.setValueExpression("itemValue", expressionFactory.createValueExpression(elContext, "#{sporttype}", SportType.class));
        sporttypeCreateInput.setConverter(new SportTypeConverter());
        sporttypeCreateInput.setRequired(false);
        htmlPanelGrid.getChildren().add(sporttypeCreateInput);
        
        Message sporttypeCreateInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        sporttypeCreateInputMessage.setId("sporttypeCreateInputMessage");
        sporttypeCreateInputMessage.setFor("sporttypeCreateInput");
        sporttypeCreateInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(sporttypeCreateInputMessage);
        
        HtmlOutputText leagueCreateOutput = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        leagueCreateOutput.setId("leagueCreateOutput");
        leagueCreateOutput.setValue("League:   ");
        htmlPanelGrid.getChildren().add(leagueCreateOutput);
        
        AutoComplete leagueCreateInput = (AutoComplete) application.createComponent(AutoComplete.COMPONENT_TYPE);
        leagueCreateInput.setId("leagueCreateInput");
        leagueCreateInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{rencontreBean.rencontre.league}", League.class));
        leagueCreateInput.setCompleteMethod(expressionFactory.createMethodExpression(elContext, "#{rencontreBean.completeLeague}", List.class, new Class[] { String.class }));
        leagueCreateInput.setDropdown(true);
        leagueCreateInput.setValueExpression("var", expressionFactory.createValueExpression(elContext, "league", String.class));
        leagueCreateInput.setValueExpression("itemLabel", expressionFactory.createValueExpression(elContext, "#{league.name} #{league.description}", String.class));
        leagueCreateInput.setValueExpression("itemValue", expressionFactory.createValueExpression(elContext, "#{league}", League.class));
        leagueCreateInput.setConverter(new LeagueConverter());
        leagueCreateInput.setRequired(false);
        htmlPanelGrid.getChildren().add(leagueCreateInput);
        
        Message leagueCreateInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        leagueCreateInputMessage.setId("leagueCreateInputMessage");
        leagueCreateInputMessage.setFor("leagueCreateInput");
        leagueCreateInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(leagueCreateInputMessage);
        
        HtmlOutputText createdByCreateOutput = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        createdByCreateOutput.setId("createdByCreateOutput");
        createdByCreateOutput.setValue("Created By:   ");
        htmlPanelGrid.getChildren().add(createdByCreateOutput);
        
        AutoComplete createdByCreateInput = (AutoComplete) application.createComponent(AutoComplete.COMPONENT_TYPE);
        createdByCreateInput.setId("createdByCreateInput");
        createdByCreateInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{rencontreBean.rencontre.createdBy}", UserAccount.class));
        createdByCreateInput.setCompleteMethod(expressionFactory.createMethodExpression(elContext, "#{rencontreBean.completeCreatedBy}", List.class, new Class[] { String.class }));
        createdByCreateInput.setDropdown(true);
        createdByCreateInput.setValueExpression("var", expressionFactory.createValueExpression(elContext, "createdBy", String.class));
        createdByCreateInput.setValueExpression("itemLabel", expressionFactory.createValueExpression(elContext, "#{createdBy.username} #{createdBy.password} #{createdBy.firstName} #{createdBy.lastName}", String.class));
        createdByCreateInput.setValueExpression("itemValue", expressionFactory.createValueExpression(elContext, "#{createdBy}", UserAccount.class));
        createdByCreateInput.setConverter(new UserAccountConverter());
        createdByCreateInput.setRequired(false);
        htmlPanelGrid.getChildren().add(createdByCreateInput);
        
        Message createdByCreateInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        createdByCreateInputMessage.setId("createdByCreateInputMessage");
        createdByCreateInputMessage.setFor("createdByCreateInput");
        createdByCreateInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(createdByCreateInputMessage);
        
        return htmlPanelGrid;
    }

	public HtmlPanelGrid populateEditPanel() {
        FacesContext facesContext = FacesContext.getCurrentInstance();
        Application application = facesContext.getApplication();
        ExpressionFactory expressionFactory = application.getExpressionFactory();
        ELContext elContext = facesContext.getELContext();
        
        HtmlPanelGrid htmlPanelGrid = (HtmlPanelGrid) application.createComponent(HtmlPanelGrid.COMPONENT_TYPE);
        
        HtmlOutputText equipeAEditOutput = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        equipeAEditOutput.setId("equipeAEditOutput");
        equipeAEditOutput.setValue("Equipe A:   ");
        htmlPanelGrid.getChildren().add(equipeAEditOutput);
        
        AutoComplete equipeAEditInput = (AutoComplete) application.createComponent(AutoComplete.COMPONENT_TYPE);
        equipeAEditInput.setId("equipeAEditInput");
        equipeAEditInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{rencontreBean.rencontre.equipeA}", Equip.class));
        equipeAEditInput.setCompleteMethod(expressionFactory.createMethodExpression(elContext, "#{rencontreBean.completeEquipeA}", List.class, new Class[] { String.class }));
        equipeAEditInput.setDropdown(true);
        equipeAEditInput.setValueExpression("var", expressionFactory.createValueExpression(elContext, "equipeA", String.class));
        equipeAEditInput.setValueExpression("itemLabel", expressionFactory.createValueExpression(elContext, "#{equipeA.name} #{equipeA.description}", String.class));
        equipeAEditInput.setValueExpression("itemValue", expressionFactory.createValueExpression(elContext, "#{equipeA}", Equip.class));
        equipeAEditInput.setConverter(new EquipConverter());
        equipeAEditInput.setRequired(false);
        htmlPanelGrid.getChildren().add(equipeAEditInput);
        
        Message equipeAEditInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        equipeAEditInputMessage.setId("equipeAEditInputMessage");
        equipeAEditInputMessage.setFor("equipeAEditInput");
        equipeAEditInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(equipeAEditInputMessage);
        
        HtmlOutputText equipeBEditOutput = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        equipeBEditOutput.setId("equipeBEditOutput");
        equipeBEditOutput.setValue("Equipe B:   ");
        htmlPanelGrid.getChildren().add(equipeBEditOutput);
        
        AutoComplete equipeBEditInput = (AutoComplete) application.createComponent(AutoComplete.COMPONENT_TYPE);
        equipeBEditInput.setId("equipeBEditInput");
        equipeBEditInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{rencontreBean.rencontre.equipeB}", Equip.class));
        equipeBEditInput.setCompleteMethod(expressionFactory.createMethodExpression(elContext, "#{rencontreBean.completeEquipeB}", List.class, new Class[] { String.class }));
        equipeBEditInput.setDropdown(true);
        equipeBEditInput.setValueExpression("var", expressionFactory.createValueExpression(elContext, "equipeB", String.class));
        equipeBEditInput.setValueExpression("itemLabel", expressionFactory.createValueExpression(elContext, "#{equipeB.name} #{equipeB.description}", String.class));
        equipeBEditInput.setValueExpression("itemValue", expressionFactory.createValueExpression(elContext, "#{equipeB}", Equip.class));
        equipeBEditInput.setConverter(new EquipConverter());
        equipeBEditInput.setRequired(false);
        htmlPanelGrid.getChildren().add(equipeBEditInput);
        
        Message equipeBEditInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        equipeBEditInputMessage.setId("equipeBEditInputMessage");
        equipeBEditInputMessage.setFor("equipeBEditInput");
        equipeBEditInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(equipeBEditInputMessage);
        
        HtmlOutputText creationDateEditOutput = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        creationDateEditOutput.setId("creationDateEditOutput");
        creationDateEditOutput.setValue("Creation Date:   ");
        htmlPanelGrid.getChildren().add(creationDateEditOutput);
        
        Calendar creationDateEditInput = (Calendar) application.createComponent(Calendar.COMPONENT_TYPE);
        creationDateEditInput.setId("creationDateEditInput");
        creationDateEditInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{rencontreBean.rencontre.creationDate}", Date.class));
        creationDateEditInput.setNavigator(true);
        creationDateEditInput.setEffect("slideDown");
        creationDateEditInput.setPattern("dd/MM/yyyy");
        creationDateEditInput.setRequired(false);
        htmlPanelGrid.getChildren().add(creationDateEditInput);
        
        Message creationDateEditInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        creationDateEditInputMessage.setId("creationDateEditInputMessage");
        creationDateEditInputMessage.setFor("creationDateEditInput");
        creationDateEditInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(creationDateEditInputMessage);
        
        HtmlOutputText lieuEditOutput = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        lieuEditOutput.setId("lieuEditOutput");
        lieuEditOutput.setValue("Lieu:   ");
        htmlPanelGrid.getChildren().add(lieuEditOutput);
        
        InputText lieuEditInput = (InputText) application.createComponent(InputText.COMPONENT_TYPE);
        lieuEditInput.setId("lieuEditInput");
        lieuEditInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{rencontreBean.rencontre.lieu}", String.class));
        htmlPanelGrid.getChildren().add(lieuEditInput);
        
        Message lieuEditInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        lieuEditInputMessage.setId("lieuEditInputMessage");
        lieuEditInputMessage.setFor("lieuEditInput");
        lieuEditInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(lieuEditInputMessage);
        
        HtmlOutputText rencontreDateEditOutput = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        rencontreDateEditOutput.setId("rencontreDateEditOutput");
        rencontreDateEditOutput.setValue("Rencontre Date:   ");
        htmlPanelGrid.getChildren().add(rencontreDateEditOutput);
        
        Calendar rencontreDateEditInput = (Calendar) application.createComponent(Calendar.COMPONENT_TYPE);
        rencontreDateEditInput.setId("rencontreDateEditInput");
        rencontreDateEditInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{rencontreBean.rencontre.rencontreDate}", Date.class));
        rencontreDateEditInput.setNavigator(true);
        rencontreDateEditInput.setEffect("slideDown");
        rencontreDateEditInput.setPattern("dd/MM/yyyy");
        rencontreDateEditInput.setRequired(false);
        htmlPanelGrid.getChildren().add(rencontreDateEditInput);
        
        Message rencontreDateEditInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        rencontreDateEditInputMessage.setId("rencontreDateEditInputMessage");
        rencontreDateEditInputMessage.setFor("rencontreDateEditInput");
        rencontreDateEditInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(rencontreDateEditInputMessage);
        
        HtmlOutputText sporttypeEditOutput = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        sporttypeEditOutput.setId("sporttypeEditOutput");
        sporttypeEditOutput.setValue("Sporttype:   ");
        htmlPanelGrid.getChildren().add(sporttypeEditOutput);
        
        AutoComplete sporttypeEditInput = (AutoComplete) application.createComponent(AutoComplete.COMPONENT_TYPE);
        sporttypeEditInput.setId("sporttypeEditInput");
        sporttypeEditInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{rencontreBean.rencontre.sporttype}", SportType.class));
        sporttypeEditInput.setCompleteMethod(expressionFactory.createMethodExpression(elContext, "#{rencontreBean.completeSporttype}", List.class, new Class[] { String.class }));
        sporttypeEditInput.setDropdown(true);
        sporttypeEditInput.setValueExpression("var", expressionFactory.createValueExpression(elContext, "sporttype", String.class));
        sporttypeEditInput.setValueExpression("itemLabel", expressionFactory.createValueExpression(elContext, "#{sporttype.name} #{sporttype.description}", String.class));
        sporttypeEditInput.setValueExpression("itemValue", expressionFactory.createValueExpression(elContext, "#{sporttype}", SportType.class));
        sporttypeEditInput.setConverter(new SportTypeConverter());
        sporttypeEditInput.setRequired(false);
        htmlPanelGrid.getChildren().add(sporttypeEditInput);
        
        Message sporttypeEditInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        sporttypeEditInputMessage.setId("sporttypeEditInputMessage");
        sporttypeEditInputMessage.setFor("sporttypeEditInput");
        sporttypeEditInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(sporttypeEditInputMessage);
        
        HtmlOutputText leagueEditOutput = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        leagueEditOutput.setId("leagueEditOutput");
        leagueEditOutput.setValue("League:   ");
        htmlPanelGrid.getChildren().add(leagueEditOutput);
        
        AutoComplete leagueEditInput = (AutoComplete) application.createComponent(AutoComplete.COMPONENT_TYPE);
        leagueEditInput.setId("leagueEditInput");
        leagueEditInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{rencontreBean.rencontre.league}", League.class));
        leagueEditInput.setCompleteMethod(expressionFactory.createMethodExpression(elContext, "#{rencontreBean.completeLeague}", List.class, new Class[] { String.class }));
        leagueEditInput.setDropdown(true);
        leagueEditInput.setValueExpression("var", expressionFactory.createValueExpression(elContext, "league", String.class));
        leagueEditInput.setValueExpression("itemLabel", expressionFactory.createValueExpression(elContext, "#{league.name} #{league.description}", String.class));
        leagueEditInput.setValueExpression("itemValue", expressionFactory.createValueExpression(elContext, "#{league}", League.class));
        leagueEditInput.setConverter(new LeagueConverter());
        leagueEditInput.setRequired(false);
        htmlPanelGrid.getChildren().add(leagueEditInput);
        
        Message leagueEditInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        leagueEditInputMessage.setId("leagueEditInputMessage");
        leagueEditInputMessage.setFor("leagueEditInput");
        leagueEditInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(leagueEditInputMessage);
        
        HtmlOutputText createdByEditOutput = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        createdByEditOutput.setId("createdByEditOutput");
        createdByEditOutput.setValue("Created By:   ");
        htmlPanelGrid.getChildren().add(createdByEditOutput);
        
        AutoComplete createdByEditInput = (AutoComplete) application.createComponent(AutoComplete.COMPONENT_TYPE);
        createdByEditInput.setId("createdByEditInput");
        createdByEditInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{rencontreBean.rencontre.createdBy}", UserAccount.class));
        createdByEditInput.setCompleteMethod(expressionFactory.createMethodExpression(elContext, "#{rencontreBean.completeCreatedBy}", List.class, new Class[] { String.class }));
        createdByEditInput.setDropdown(true);
        createdByEditInput.setValueExpression("var", expressionFactory.createValueExpression(elContext, "createdBy", String.class));
        createdByEditInput.setValueExpression("itemLabel", expressionFactory.createValueExpression(elContext, "#{createdBy.username} #{createdBy.password} #{createdBy.firstName} #{createdBy.lastName}", String.class));
        createdByEditInput.setValueExpression("itemValue", expressionFactory.createValueExpression(elContext, "#{createdBy}", UserAccount.class));
        createdByEditInput.setConverter(new UserAccountConverter());
        createdByEditInput.setRequired(false);
        htmlPanelGrid.getChildren().add(createdByEditInput);
        
        Message createdByEditInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        createdByEditInputMessage.setId("createdByEditInputMessage");
        createdByEditInputMessage.setFor("createdByEditInput");
        createdByEditInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(createdByEditInputMessage);
        
        return htmlPanelGrid;
    }

	public HtmlPanelGrid populateViewPanel() {
        FacesContext facesContext = FacesContext.getCurrentInstance();
        Application application = facesContext.getApplication();
        ExpressionFactory expressionFactory = application.getExpressionFactory();
        ELContext elContext = facesContext.getELContext();
        
        HtmlPanelGrid htmlPanelGrid = (HtmlPanelGrid) application.createComponent(HtmlPanelGrid.COMPONENT_TYPE);
        
        HtmlOutputText equipeALabel = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        equipeALabel.setId("equipeALabel");
        equipeALabel.setValue("Equipe A:   ");
        htmlPanelGrid.getChildren().add(equipeALabel);
        
        HtmlOutputText equipeAValue = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        equipeAValue.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{rencontreBean.rencontre.equipeA}", Equip.class));
        equipeAValue.setConverter(new EquipConverter());
        htmlPanelGrid.getChildren().add(equipeAValue);
        
        HtmlOutputText equipeBLabel = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        equipeBLabel.setId("equipeBLabel");
        equipeBLabel.setValue("Equipe B:   ");
        htmlPanelGrid.getChildren().add(equipeBLabel);
        
        HtmlOutputText equipeBValue = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        equipeBValue.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{rencontreBean.rencontre.equipeB}", Equip.class));
        equipeBValue.setConverter(new EquipConverter());
        htmlPanelGrid.getChildren().add(equipeBValue);
        
        HtmlOutputText creationDateLabel = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        creationDateLabel.setId("creationDateLabel");
        creationDateLabel.setValue("Creation Date:   ");
        htmlPanelGrid.getChildren().add(creationDateLabel);
        
        HtmlOutputText creationDateValue = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        creationDateValue.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{rencontreBean.rencontre.creationDate}", Date.class));
        DateTimeConverter creationDateValueConverter = (DateTimeConverter) application.createConverter(DateTimeConverter.CONVERTER_ID);
        creationDateValueConverter.setPattern("dd/MM/yyyy");
        creationDateValue.setConverter(creationDateValueConverter);
        htmlPanelGrid.getChildren().add(creationDateValue);
        
        HtmlOutputText lieuLabel = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        lieuLabel.setId("lieuLabel");
        lieuLabel.setValue("Lieu:   ");
        htmlPanelGrid.getChildren().add(lieuLabel);
        
        HtmlOutputText lieuValue = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        lieuValue.setId("lieuValue");
        lieuValue.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{rencontreBean.rencontre.lieu}", String.class));
        htmlPanelGrid.getChildren().add(lieuValue);
        
        HtmlOutputText rencontreDateLabel = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        rencontreDateLabel.setId("rencontreDateLabel");
        rencontreDateLabel.setValue("Rencontre Date:   ");
        htmlPanelGrid.getChildren().add(rencontreDateLabel);
        
        HtmlOutputText rencontreDateValue = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        rencontreDateValue.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{rencontreBean.rencontre.rencontreDate}", Date.class));
        DateTimeConverter rencontreDateValueConverter = (DateTimeConverter) application.createConverter(DateTimeConverter.CONVERTER_ID);
        rencontreDateValueConverter.setPattern("dd/MM/yyyy");
        rencontreDateValue.setConverter(rencontreDateValueConverter);
        htmlPanelGrid.getChildren().add(rencontreDateValue);
        
        HtmlOutputText sporttypeLabel = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        sporttypeLabel.setId("sporttypeLabel");
        sporttypeLabel.setValue("Sporttype:   ");
        htmlPanelGrid.getChildren().add(sporttypeLabel);
        
        HtmlOutputText sporttypeValue = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        sporttypeValue.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{rencontreBean.rencontre.sporttype}", SportType.class));
        sporttypeValue.setConverter(new SportTypeConverter());
        htmlPanelGrid.getChildren().add(sporttypeValue);
        
        HtmlOutputText leagueLabel = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        leagueLabel.setId("leagueLabel");
        leagueLabel.setValue("League:   ");
        htmlPanelGrid.getChildren().add(leagueLabel);
        
        HtmlOutputText leagueValue = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        leagueValue.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{rencontreBean.rencontre.league}", League.class));
        leagueValue.setConverter(new LeagueConverter());
        htmlPanelGrid.getChildren().add(leagueValue);
        
        HtmlOutputText createdByLabel = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        createdByLabel.setId("createdByLabel");
        createdByLabel.setValue("Created By:   ");
        htmlPanelGrid.getChildren().add(createdByLabel);
        
        HtmlOutputText createdByValue = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        createdByValue.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{rencontreBean.rencontre.createdBy}", UserAccount.class));
        createdByValue.setConverter(new UserAccountConverter());
        htmlPanelGrid.getChildren().add(createdByValue);
        
        return htmlPanelGrid;
    }

	public Rencontre getRencontre() {
        if (rencontre == null) {
            rencontre = new Rencontre();
        }
        return rencontre;
    }

	public void setRencontre(Rencontre rencontre) {
        this.rencontre = rencontre;
    }

	public List<Equip> completeEquipeA(String query) {
        List<Equip> suggestions = new ArrayList<Equip>();
        for (Equip equip : equipService.findAllEquips()) {
            String equipStr = String.valueOf(equip.getName());
            if (equipStr.toLowerCase().startsWith(query.toLowerCase())) {
                suggestions.add(equip);
            }
        }
        if(this.rencontre.getEquipeB()!=null)    suggestions.remove(String.valueOf(rencontre.getEquipeB().getName()));
        return suggestions;
    }

	public List<Equip> completeEquipeB(String query) {
        List<Equip> suggestions = new ArrayList<Equip>();
        for (Equip equip : equipService.findAllEquips()) {
            String equipStr = (equip.getName());
            if (equipStr.toLowerCase().startsWith(query.toLowerCase())) {
                suggestions.add(equip);
            }
        }
        if(this.rencontre.getEquipeA()!=null)    suggestions.remove(String.valueOf(rencontre.getEquipeA().getName()));
        return suggestions;
    }

	public List<SportType> completeSporttype(String query) {
        List<SportType> suggestions = new ArrayList<SportType>();
        for (SportType sportType : sportTypeService.findAllSportTypes()) {
            String sportTypeStr = String.valueOf(sportType.getName());
            if (sportTypeStr.toLowerCase().startsWith(query.toLowerCase())) {
                suggestions.add(sportType);
            }
        }
        return suggestions;
    }

	public List<League> completeLeague(String query) {
        List<League> suggestions = new ArrayList<League>();
        for (League league : leagueService.findAllLeagues()) {
            String leagueStr = String.valueOf(league.getName());
            if (leagueStr.toLowerCase().startsWith(query.toLowerCase())) {
                suggestions.add(league);
            }
        }
        return suggestions;
    }

	public List<UserAccount> completeCreatedBy(String query) {
        List<UserAccount> suggestions = new ArrayList<UserAccount>();
        for (UserAccount userAccount : userAccountService.findAllUserAccounts()) {
            String userAccountStr = String.valueOf(userAccount.getUsername() +  " "  + userAccount.getPassword() +  " "  + userAccount.getFirstName() +  " "  + userAccount.getLastName());
            if (userAccountStr.toLowerCase().startsWith(query.toLowerCase())) {
                suggestions.add(userAccount);
            }
        }
        return suggestions;
    }
	
	 public List<Etat> completeEtat(String query) {
	         etats = new ArrayList<Etat>();
	        for (Etat etat : Etat.values()) {
	            if (etat.name().toLowerCase().startsWith(query.toLowerCase())) {
	                etats.add(etat);
	            }
	        }
	        return etats;
	    }

	public String onEdit() {
        return null;
    }

	public boolean isCreateDialogVisible() {
        return createDialogVisible;
    }

	public void setCreateDialogVisible(boolean createDialogVisible) {
        this.createDialogVisible = createDialogVisible;
    }

	public String displayList() {
        createDialogVisible = false;
        findAllRencontres();
        return "rencontre";
    }

	public String displayCreateDialog() {
        rencontre = new Rencontre();
        createDialogVisible = true;
        return "rencontre";
    }

	public String persist() {
        String message = "";
        if (rencontre.getId() != null) {
            rencontreService.updateRencontre(rencontre);
            message = "Successfully updated";
        } else {
            rencontreService.saveRencontre(rencontre);
            message = "Successfully created";
        }
        RequestContext context = RequestContext.getCurrentInstance();
        context.execute("createDialog.hide()");
        context.execute("editDialog.hide()");
        context.execute("parisDialog.hide()");
        
        FacesMessage facesMessage = new FacesMessage(message);
        FacesContext.getCurrentInstance().addMessage(null, facesMessage);
        reset();
        return findAllRencontres();
    }

	public String delete() {
        rencontreService.deleteRencontre(rencontre);
        FacesMessage facesMessage = new FacesMessage("Successfully deleted");
        FacesContext.getCurrentInstance().addMessage(null, facesMessage);
        reset();
        return findAllRencontres();
    }

	public void reset() {
        rencontre = null;
        createDialogVisible = false;
        parisDialogVisible = false;
    }

	public void handleDialogClose(CloseEvent event) {
        reset();
    }
	
	public void editEvent(RowEditEvent event) {  
		
        ((Paris) event.getObject()).merge();
          
    }  
	
	public void setSelectedParisMap(List<CategoryParis> selectedParisMap) {
        /*if (selectedParisMap != null) {
            rencontre.setParisMap(new HashSet<CategoryParis>(selectedParisMap));
        }
        this.selectedParisMap = selectedParisMap;*/
    }   
}
