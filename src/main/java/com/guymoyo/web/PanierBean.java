package com.guymoyo.web;

import java.math.BigDecimal;
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
import javax.faces.component.UISelectItems;
import javax.faces.component.html.HtmlOutputText;
import javax.faces.component.html.HtmlPanelGrid;
import javax.faces.context.FacesContext;
import javax.faces.convert.DateTimeConverter;

import com.guymoyo.domain.Choix;
import com.guymoyo.domain.Panier;
import com.guymoyo.domain.Paris;
import com.guymoyo.domain.UserAccount;
import com.guymoyo.service.PanierService;
import com.guymoyo.service.PariseService;
import com.guymoyo.service.UserAccountService;
import com.guymoyo.web.converter.ChoixConverter;
import com.guymoyo.web.converter.UserAccountConverter;
import org.primefaces.component.autocomplete.AutoComplete;
import org.primefaces.component.calendar.Calendar;
import org.primefaces.component.inputtext.InputText;
import org.primefaces.component.message.Message;
import org.primefaces.component.selectmanymenu.SelectManyMenu;
import org.primefaces.context.RequestContext;
import org.primefaces.event.CloseEvent;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.roo.addon.jsf.managedbean.RooJsfManagedBean;
import org.springframework.roo.addon.serializable.RooSerializable;

@ManagedBean(name = "panierBean")
@SessionScoped
@RooSerializable
@RooJsfManagedBean(entity = Panier.class, beanName = "panierBean")
public class PanierBean {
	
	 public void setSelectedListChoix(List<Choix> selectedListChoix) {
	       /* if (selectedListChoix != null) {
	            panier.setListChoix(new HashSet<Choix>(selectedListChoix));
	        }
	        this.selectedListChoix = selectedListChoix;*/
	    }

	@Autowired
    PanierService panierService;
	
	@Autowired
	PariseService PariseService;

	@Autowired
    UserAccountService userAccountService;

	private String name = "Paniers";

	private Panier panier = new Panier();

	private List<Panier> allPaniers;

	private boolean dataVisible = false;

	private List<String> columns;

	private HtmlPanelGrid createPanelGrid;

	private HtmlPanelGrid editPanelGrid;

	private HtmlPanelGrid viewPanelGrid;

	private boolean createDialogVisible = false;

	private List<Choix> selectedListChoix;
	
	private Paris selectedParis;

	public Paris getSelectedParis() {
		return selectedParis;
	}

	public void setSelectedParis(Paris selectedParis) {
		this.selectedParis = selectedParis;
	}

	@PostConstruct
    public void init() {
        columns = new ArrayList<String>();
        columns.add("dateOfCreation");
        columns.add("montantTotal");
        columns.add("gainTotal");
    }

	public String getName() {
        return name;
    }

	public List<String> getColumns() {
        return columns;
    }

	public List<Panier> getAllPaniers() {
        return allPaniers;
    }

	public void setAllPaniers(List<Panier> allPaniers) {
        this.allPaniers = allPaniers;
    }

	public String findAllPaniers() {
        allPaniers = panierService.findAllPaniers();
        dataVisible = !allPaniers.isEmpty();
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
        
        HtmlOutputText userAccountCreateOutput = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        userAccountCreateOutput.setId("userAccountCreateOutput");
        userAccountCreateOutput.setValue("User Account:   ");
        htmlPanelGrid.getChildren().add(userAccountCreateOutput);
        
        AutoComplete userAccountCreateInput = (AutoComplete) application.createComponent(AutoComplete.COMPONENT_TYPE);
        userAccountCreateInput.setId("userAccountCreateInput");
        userAccountCreateInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{panierBean.panier.userAccount}", UserAccount.class));
        userAccountCreateInput.setCompleteMethod(expressionFactory.createMethodExpression(elContext, "#{panierBean.completeUserAccount}", List.class, new Class[] { String.class }));
        userAccountCreateInput.setDropdown(true);
        userAccountCreateInput.setValueExpression("var", expressionFactory.createValueExpression(elContext, "userAccount", String.class));
        userAccountCreateInput.setValueExpression("itemLabel", expressionFactory.createValueExpression(elContext, "#{userAccount.username} #{userAccount.password} #{userAccount.firstName} #{userAccount.lastName}", String.class));
        userAccountCreateInput.setValueExpression("itemValue", expressionFactory.createValueExpression(elContext, "#{userAccount}", UserAccount.class));
        userAccountCreateInput.setConverter(new UserAccountConverter());
        userAccountCreateInput.setRequired(false);
        htmlPanelGrid.getChildren().add(userAccountCreateInput);
        
        Message userAccountCreateInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        userAccountCreateInputMessage.setId("userAccountCreateInputMessage");
        userAccountCreateInputMessage.setFor("userAccountCreateInput");
        userAccountCreateInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(userAccountCreateInputMessage);
        
        HtmlOutputText dateOfCreationCreateOutput = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        dateOfCreationCreateOutput.setId("dateOfCreationCreateOutput");
        dateOfCreationCreateOutput.setValue("Date Of Creation:   ");
        htmlPanelGrid.getChildren().add(dateOfCreationCreateOutput);
        
        Calendar dateOfCreationCreateInput = (Calendar) application.createComponent(Calendar.COMPONENT_TYPE);
        dateOfCreationCreateInput.setId("dateOfCreationCreateInput");
        dateOfCreationCreateInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{panierBean.panier.dateOfCreation}", Date.class));
        dateOfCreationCreateInput.setNavigator(true);
        dateOfCreationCreateInput.setEffect("slideDown");
        dateOfCreationCreateInput.setPattern("dd/MM/yyyy");
        dateOfCreationCreateInput.setRequired(false);
        htmlPanelGrid.getChildren().add(dateOfCreationCreateInput);
        
        Message dateOfCreationCreateInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        dateOfCreationCreateInputMessage.setId("dateOfCreationCreateInputMessage");
        dateOfCreationCreateInputMessage.setFor("dateOfCreationCreateInput");
        dateOfCreationCreateInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(dateOfCreationCreateInputMessage);
        
        HtmlOutputText montantTotalCreateOutput = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        montantTotalCreateOutput.setId("montantTotalCreateOutput");
        montantTotalCreateOutput.setValue("Montant Total: * ");
        htmlPanelGrid.getChildren().add(montantTotalCreateOutput);
        
        InputText montantTotalCreateInput = (InputText) application.createComponent(InputText.COMPONENT_TYPE);
        montantTotalCreateInput.setId("montantTotalCreateInput");
        montantTotalCreateInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{panierBean.panier.montantTotal}", BigDecimal.class));
        montantTotalCreateInput.setRequired(true);
        htmlPanelGrid.getChildren().add(montantTotalCreateInput);
        
        Message montantTotalCreateInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        montantTotalCreateInputMessage.setId("montantTotalCreateInputMessage");
        montantTotalCreateInputMessage.setFor("montantTotalCreateInput");
        montantTotalCreateInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(montantTotalCreateInputMessage);
        
        HtmlOutputText gainTotalCreateOutput = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        gainTotalCreateOutput.setId("gainTotalCreateOutput");
        gainTotalCreateOutput.setValue("Gain Total: * ");
        htmlPanelGrid.getChildren().add(gainTotalCreateOutput);
        
        InputText gainTotalCreateInput = (InputText) application.createComponent(InputText.COMPONENT_TYPE);
        gainTotalCreateInput.setId("gainTotalCreateInput");
        gainTotalCreateInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{panierBean.panier.gainTotal}", BigDecimal.class));
        gainTotalCreateInput.setRequired(true);
        htmlPanelGrid.getChildren().add(gainTotalCreateInput);
        
        Message gainTotalCreateInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        gainTotalCreateInputMessage.setId("gainTotalCreateInputMessage");
        gainTotalCreateInputMessage.setFor("gainTotalCreateInput");
        gainTotalCreateInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(gainTotalCreateInputMessage);
        
        HtmlOutputText listChoixCreateOutput = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        listChoixCreateOutput.setId("listChoixCreateOutput");
        listChoixCreateOutput.setValue("List Choix:   ");
        htmlPanelGrid.getChildren().add(listChoixCreateOutput);
        
        SelectManyMenu listChoixCreateInput = (SelectManyMenu) application.createComponent(SelectManyMenu.COMPONENT_TYPE);
        listChoixCreateInput.setId("listChoixCreateInput");
        listChoixCreateInput.setConverter(new ChoixConverter());
        listChoixCreateInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{panierBean.selectedListChoix}", List.class));
        UISelectItems listChoixCreateInputItems = (UISelectItems) application.createComponent(UISelectItems.COMPONENT_TYPE);
        listChoixCreateInputItems.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{choixBean.allChoixes}", List.class));
        listChoixCreateInput.setRequired(false);
        listChoixCreateInputItems.setValueExpression("var", expressionFactory.createValueExpression(elContext, "choix", String.class));
        listChoixCreateInputItems.setValueExpression("itemLabel", expressionFactory.createValueExpression(elContext, "#{choix}", String.class));
        listChoixCreateInputItems.setValueExpression("itemValue", expressionFactory.createValueExpression(elContext, "#{choix}", Choix.class));
        listChoixCreateInput.getChildren().add(listChoixCreateInputItems);
        htmlPanelGrid.getChildren().add(listChoixCreateInput);
        
        Message listChoixCreateInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        listChoixCreateInputMessage.setId("listChoixCreateInputMessage");
        listChoixCreateInputMessage.setFor("listChoixCreateInput");
        listChoixCreateInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(listChoixCreateInputMessage);
        
        return htmlPanelGrid;
    }

	public HtmlPanelGrid populateEditPanel() {
        FacesContext facesContext = FacesContext.getCurrentInstance();
        Application application = facesContext.getApplication();
        ExpressionFactory expressionFactory = application.getExpressionFactory();
        ELContext elContext = facesContext.getELContext();
        
        HtmlPanelGrid htmlPanelGrid = (HtmlPanelGrid) application.createComponent(HtmlPanelGrid.COMPONENT_TYPE);
        
        HtmlOutputText userAccountEditOutput = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        userAccountEditOutput.setId("userAccountEditOutput");
        userAccountEditOutput.setValue("User Account:   ");
        htmlPanelGrid.getChildren().add(userAccountEditOutput);
        
        AutoComplete userAccountEditInput = (AutoComplete) application.createComponent(AutoComplete.COMPONENT_TYPE);
        userAccountEditInput.setId("userAccountEditInput");
        userAccountEditInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{panierBean.panier.userAccount}", UserAccount.class));
        userAccountEditInput.setCompleteMethod(expressionFactory.createMethodExpression(elContext, "#{panierBean.completeUserAccount}", List.class, new Class[] { String.class }));
        userAccountEditInput.setDropdown(true);
        userAccountEditInput.setValueExpression("var", expressionFactory.createValueExpression(elContext, "userAccount", String.class));
        userAccountEditInput.setValueExpression("itemLabel", expressionFactory.createValueExpression(elContext, "#{userAccount.username} #{userAccount.password} #{userAccount.firstName} #{userAccount.lastName}", String.class));
        userAccountEditInput.setValueExpression("itemValue", expressionFactory.createValueExpression(elContext, "#{userAccount}", UserAccount.class));
        userAccountEditInput.setConverter(new UserAccountConverter());
        userAccountEditInput.setRequired(false);
        htmlPanelGrid.getChildren().add(userAccountEditInput);
        
        Message userAccountEditInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        userAccountEditInputMessage.setId("userAccountEditInputMessage");
        userAccountEditInputMessage.setFor("userAccountEditInput");
        userAccountEditInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(userAccountEditInputMessage);
        
        HtmlOutputText dateOfCreationEditOutput = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        dateOfCreationEditOutput.setId("dateOfCreationEditOutput");
        dateOfCreationEditOutput.setValue("Date Of Creation:   ");
        htmlPanelGrid.getChildren().add(dateOfCreationEditOutput);
        
        Calendar dateOfCreationEditInput = (Calendar) application.createComponent(Calendar.COMPONENT_TYPE);
        dateOfCreationEditInput.setId("dateOfCreationEditInput");
        dateOfCreationEditInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{panierBean.panier.dateOfCreation}", Date.class));
        dateOfCreationEditInput.setNavigator(true);
        dateOfCreationEditInput.setEffect("slideDown");
        dateOfCreationEditInput.setPattern("dd/MM/yyyy");
        dateOfCreationEditInput.setRequired(false);
        htmlPanelGrid.getChildren().add(dateOfCreationEditInput);
        
        Message dateOfCreationEditInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        dateOfCreationEditInputMessage.setId("dateOfCreationEditInputMessage");
        dateOfCreationEditInputMessage.setFor("dateOfCreationEditInput");
        dateOfCreationEditInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(dateOfCreationEditInputMessage);
        
        HtmlOutputText montantTotalEditOutput = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        montantTotalEditOutput.setId("montantTotalEditOutput");
        montantTotalEditOutput.setValue("Montant Total: * ");
        htmlPanelGrid.getChildren().add(montantTotalEditOutput);
        
        InputText montantTotalEditInput = (InputText) application.createComponent(InputText.COMPONENT_TYPE);
        montantTotalEditInput.setId("montantTotalEditInput");
        montantTotalEditInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{panierBean.panier.montantTotal}", BigDecimal.class));
        montantTotalEditInput.setRequired(true);
        htmlPanelGrid.getChildren().add(montantTotalEditInput);
        
        Message montantTotalEditInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        montantTotalEditInputMessage.setId("montantTotalEditInputMessage");
        montantTotalEditInputMessage.setFor("montantTotalEditInput");
        montantTotalEditInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(montantTotalEditInputMessage);
        
        HtmlOutputText gainTotalEditOutput = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        gainTotalEditOutput.setId("gainTotalEditOutput");
        gainTotalEditOutput.setValue("Gain Total: * ");
        htmlPanelGrid.getChildren().add(gainTotalEditOutput);
        
        InputText gainTotalEditInput = (InputText) application.createComponent(InputText.COMPONENT_TYPE);
        gainTotalEditInput.setId("gainTotalEditInput");
        gainTotalEditInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{panierBean.panier.gainTotal}", BigDecimal.class));
        gainTotalEditInput.setRequired(true);
        htmlPanelGrid.getChildren().add(gainTotalEditInput);
        
        Message gainTotalEditInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        gainTotalEditInputMessage.setId("gainTotalEditInputMessage");
        gainTotalEditInputMessage.setFor("gainTotalEditInput");
        gainTotalEditInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(gainTotalEditInputMessage);
        
        HtmlOutputText listChoixEditOutput = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        listChoixEditOutput.setId("listChoixEditOutput");
        listChoixEditOutput.setValue("List Choix:   ");
        htmlPanelGrid.getChildren().add(listChoixEditOutput);
        
        SelectManyMenu listChoixEditInput = (SelectManyMenu) application.createComponent(SelectManyMenu.COMPONENT_TYPE);
        listChoixEditInput.setId("listChoixEditInput");
        listChoixEditInput.setConverter(new ChoixConverter());
        listChoixEditInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{panierBean.selectedListChoix}", List.class));
        UISelectItems listChoixEditInputItems = (UISelectItems) application.createComponent(UISelectItems.COMPONENT_TYPE);
        listChoixEditInputItems.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{choixBean.allChoixes}", List.class));
        listChoixEditInput.setRequired(false);
        listChoixEditInputItems.setValueExpression("var", expressionFactory.createValueExpression(elContext, "choix", String.class));
        listChoixEditInputItems.setValueExpression("itemLabel", expressionFactory.createValueExpression(elContext, "#{choix}", String.class));
        listChoixEditInputItems.setValueExpression("itemValue", expressionFactory.createValueExpression(elContext, "#{choix}", Choix.class));
        listChoixEditInput.getChildren().add(listChoixEditInputItems);
        htmlPanelGrid.getChildren().add(listChoixEditInput);
        
        Message listChoixEditInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        listChoixEditInputMessage.setId("listChoixEditInputMessage");
        listChoixEditInputMessage.setFor("listChoixEditInput");
        listChoixEditInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(listChoixEditInputMessage);
        
        return htmlPanelGrid;
    }

	public HtmlPanelGrid populateViewPanel() {
        FacesContext facesContext = FacesContext.getCurrentInstance();
        Application application = facesContext.getApplication();
        ExpressionFactory expressionFactory = application.getExpressionFactory();
        ELContext elContext = facesContext.getELContext();
        
        HtmlPanelGrid htmlPanelGrid = (HtmlPanelGrid) application.createComponent(HtmlPanelGrid.COMPONENT_TYPE);
        
        HtmlOutputText userAccountLabel = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        userAccountLabel.setId("userAccountLabel");
        userAccountLabel.setValue("User Account:   ");
        htmlPanelGrid.getChildren().add(userAccountLabel);
        
        HtmlOutputText userAccountValue = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        userAccountValue.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{panierBean.panier.userAccount}", UserAccount.class));
        userAccountValue.setConverter(new UserAccountConverter());
        htmlPanelGrid.getChildren().add(userAccountValue);
        
        HtmlOutputText dateOfCreationLabel = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        dateOfCreationLabel.setId("dateOfCreationLabel");
        dateOfCreationLabel.setValue("Date Of Creation:   ");
        htmlPanelGrid.getChildren().add(dateOfCreationLabel);
        
        HtmlOutputText dateOfCreationValue = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        dateOfCreationValue.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{panierBean.panier.dateOfCreation}", Date.class));
        DateTimeConverter dateOfCreationValueConverter = (DateTimeConverter) application.createConverter(DateTimeConverter.CONVERTER_ID);
        dateOfCreationValueConverter.setPattern("dd/MM/yyyy");
        dateOfCreationValue.setConverter(dateOfCreationValueConverter);
        htmlPanelGrid.getChildren().add(dateOfCreationValue);
        
        HtmlOutputText montantTotalLabel = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        montantTotalLabel.setId("montantTotalLabel");
        montantTotalLabel.setValue("Montant Total:   ");
        htmlPanelGrid.getChildren().add(montantTotalLabel);
        
        HtmlOutputText montantTotalValue = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        montantTotalValue.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{panierBean.panier.montantTotal}", String.class));
        htmlPanelGrid.getChildren().add(montantTotalValue);
        
        HtmlOutputText gainTotalLabel = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        gainTotalLabel.setId("gainTotalLabel");
        gainTotalLabel.setValue("Gain Total:   ");
        htmlPanelGrid.getChildren().add(gainTotalLabel);
        
        HtmlOutputText gainTotalValue = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        gainTotalValue.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{panierBean.panier.gainTotal}", String.class));
        htmlPanelGrid.getChildren().add(gainTotalValue);
        
        HtmlOutputText listChoixLabel = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        listChoixLabel.setId("listChoixLabel");
        listChoixLabel.setValue("List Choix:   ");
        htmlPanelGrid.getChildren().add(listChoixLabel);
        
        SelectManyMenu listChoixValue = (SelectManyMenu) application.createComponent(SelectManyMenu.COMPONENT_TYPE);
        listChoixValue.setId("listChoixValue");
        listChoixValue.setConverter(new ChoixConverter());
        listChoixValue.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{panierBean.selectedListChoix}", List.class));
        UISelectItems listChoixValueItems = (UISelectItems) application.createComponent(UISelectItems.COMPONENT_TYPE);
        listChoixValue.setReadonly(true);
        listChoixValue.setDisabled(true);
        listChoixValueItems.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{panierBean.panier.listChoix}", List.class));
        listChoixValueItems.setValueExpression("var", expressionFactory.createValueExpression(elContext, "choix", String.class));
        listChoixValueItems.setValueExpression("itemLabel", expressionFactory.createValueExpression(elContext, "#{choix}", String.class));
        listChoixValueItems.setValueExpression("itemValue", expressionFactory.createValueExpression(elContext, "#{choix}", Choix.class));
        listChoixValue.getChildren().add(listChoixValueItems);
        htmlPanelGrid.getChildren().add(listChoixValue);
        
        return htmlPanelGrid;
    }

	public Panier getPanier() {
        if (panier == null) {
            panier = new Panier();
        }
        return panier;
    }

	public void setPanier(Panier panier) {
        this.panier = panier;
    }

	public List<UserAccount> completeUserAccount(String query) {
        List<UserAccount> suggestions = new ArrayList<UserAccount>();
        for (UserAccount userAccount : userAccountService.findAllUserAccounts()) {
            String userAccountStr = String.valueOf(userAccount.getUsername() +  " "  + userAccount.getPassword() +  " "  + userAccount.getFirstName() +  " "  + userAccount.getLastName());
            if (userAccountStr.toLowerCase().startsWith(query.toLowerCase())) {
                suggestions.add(userAccount);
            }
        }
        return suggestions;
    }

	public List<Choix> getSelectedListChoix() {
        return selectedListChoix;
    }

	public String onEdit() {
        if (panier != null && panier.getListChoix() != null) {
            selectedListChoix = new ArrayList<Choix>(panier.getListChoix());
        }
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
        findAllPaniers();
        return "panier";
    }

	public String displayCreateDialog() {
        panier = new Panier();
        createDialogVisible = true;
        return "panier";
    }

	public String persist() {
        String message = "";
        if (panier.getId() != null) {
            panierService.updatePanier(panier);
            message = "Successfully updated";
        } else {
            panierService.savePanier(panier);
            message = "Successfully created";
        }
        RequestContext context = RequestContext.getCurrentInstance();
        context.execute("createDialog.hide()");
        context.execute("editDialog.hide()");
        
        FacesMessage facesMessage = new FacesMessage(message);
        FacesContext.getCurrentInstance().addMessage(null, facesMessage);
        reset();
        return findAllPaniers();
    }

	public String delete() {
        panierService.deletePanier(panier);
        FacesMessage facesMessage = new FacesMessage("Successfully deleted");
        FacesContext.getCurrentInstance().addMessage(null, facesMessage);
        reset();
        return findAllPaniers();
    }

	public void reset() {
        panier = null;
        selectedListChoix = null;
        createDialogVisible = false;
    }

	public void handleDialogClose(CloseEvent event) {
        reset();
    }
	
	public String select(){
		panier.getListChoix().add(PariseService.transformParisToChoix(selectedParis));
		panier.nbreItem();
		return null;
	}
	
	
	
	
}
