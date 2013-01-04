// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.guymoyo.web;

import com.guymoyo.domain.Societe;
import com.guymoyo.service.SocieteService;
import com.guymoyo.web.SocieteBean;
import java.math.BigDecimal;
import java.util.ArrayList;
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
import org.primefaces.component.inputtext.InputText;
import org.primefaces.component.message.Message;
import org.primefaces.context.RequestContext;
import org.primefaces.event.CloseEvent;
import org.springframework.beans.factory.annotation.Autowired;

privileged aspect SocieteBean_Roo_ManagedBean {
    
    declare @type: SocieteBean: @ManagedBean(name = "societeBean");
    
    declare @type: SocieteBean: @SessionScoped;
    
    @Autowired
    SocieteService SocieteBean.societeService;
    
    private String SocieteBean.name = "Societes";
    
    private Societe SocieteBean.societe;
    
    private List<Societe> SocieteBean.allSocietes;
    
    private boolean SocieteBean.dataVisible = false;
    
    private List<String> SocieteBean.columns;
    
    private HtmlPanelGrid SocieteBean.createPanelGrid;
    
    private HtmlPanelGrid SocieteBean.editPanelGrid;
    
    private HtmlPanelGrid SocieteBean.viewPanelGrid;
    
    private boolean SocieteBean.createDialogVisible = false;
    
    @PostConstruct
    public void SocieteBean.init() {
        columns = new ArrayList<String>();
        columns.add("Name");
        columns.add("Address");
        columns.add("CodePostal");
        columns.add("City");
        columns.add("Email");
    }
    
    public String SocieteBean.getName() {
        return name;
    }
    
    public List<String> SocieteBean.getColumns() {
        return columns;
    }
    
    public List<Societe> SocieteBean.getAllSocietes() {
        return allSocietes;
    }
    
    public void SocieteBean.setAllSocietes(List<Societe> allSocietes) {
        this.allSocietes = allSocietes;
    }
    
    public String SocieteBean.findAllSocietes() {
        allSocietes = societeService.findAllSocietes();
        dataVisible = !allSocietes.isEmpty();
        return null;
    }
    
    public boolean SocieteBean.isDataVisible() {
        return dataVisible;
    }
    
    public void SocieteBean.setDataVisible(boolean dataVisible) {
        this.dataVisible = dataVisible;
    }
    
    public HtmlPanelGrid SocieteBean.getCreatePanelGrid() {
        if (createPanelGrid == null) {
            createPanelGrid = populateCreatePanel();
        }
        return createPanelGrid;
    }
    
    public void SocieteBean.setCreatePanelGrid(HtmlPanelGrid createPanelGrid) {
        this.createPanelGrid = createPanelGrid;
    }
    
    public HtmlPanelGrid SocieteBean.getEditPanelGrid() {
        if (editPanelGrid == null) {
            editPanelGrid = populateEditPanel();
        }
        return editPanelGrid;
    }
    
    public void SocieteBean.setEditPanelGrid(HtmlPanelGrid editPanelGrid) {
        this.editPanelGrid = editPanelGrid;
    }
    
    public HtmlPanelGrid SocieteBean.getViewPanelGrid() {
        return populateViewPanel();
    }
    
    public void SocieteBean.setViewPanelGrid(HtmlPanelGrid viewPanelGrid) {
        this.viewPanelGrid = viewPanelGrid;
    }
    
    public HtmlPanelGrid SocieteBean.populateCreatePanel() {
        FacesContext facesContext = FacesContext.getCurrentInstance();
        Application application = facesContext.getApplication();
        ExpressionFactory expressionFactory = application.getExpressionFactory();
        ELContext elContext = facesContext.getELContext();
        
        HtmlPanelGrid htmlPanelGrid = (HtmlPanelGrid) application.createComponent(HtmlPanelGrid.COMPONENT_TYPE);
        
        HtmlOutputText NameCreateOutput = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        NameCreateOutput.setId("NameCreateOutput");
        NameCreateOutput.setValue("Name: * ");
        htmlPanelGrid.getChildren().add(NameCreateOutput);
        
        InputText NameCreateInput = (InputText) application.createComponent(InputText.COMPONENT_TYPE);
        NameCreateInput.setId("NameCreateInput");
        NameCreateInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{societeBean.societe.Name}", String.class));
        htmlPanelGrid.getChildren().add(NameCreateInput);
        
        Message NameCreateInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        NameCreateInputMessage.setId("NameCreateInputMessage");
        NameCreateInputMessage.setFor("NameCreateInput");
        NameCreateInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(NameCreateInputMessage);
        
        HtmlOutputText AddressCreateOutput = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        AddressCreateOutput.setId("AddressCreateOutput");
        AddressCreateOutput.setValue("Address:   ");
        htmlPanelGrid.getChildren().add(AddressCreateOutput);
        
        InputText AddressCreateInput = (InputText) application.createComponent(InputText.COMPONENT_TYPE);
        AddressCreateInput.setId("AddressCreateInput");
        AddressCreateInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{societeBean.societe.Address}", String.class));
        htmlPanelGrid.getChildren().add(AddressCreateInput);
        
        Message AddressCreateInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        AddressCreateInputMessage.setId("AddressCreateInputMessage");
        AddressCreateInputMessage.setFor("AddressCreateInput");
        AddressCreateInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(AddressCreateInputMessage);
        
        HtmlOutputText CodePostalCreateOutput = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        CodePostalCreateOutput.setId("CodePostalCreateOutput");
        CodePostalCreateOutput.setValue("Code Postal:   ");
        htmlPanelGrid.getChildren().add(CodePostalCreateOutput);
        
        InputText CodePostalCreateInput = (InputText) application.createComponent(InputText.COMPONENT_TYPE);
        CodePostalCreateInput.setId("CodePostalCreateInput");
        CodePostalCreateInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{societeBean.societe.CodePostal}", String.class));
        htmlPanelGrid.getChildren().add(CodePostalCreateInput);
        
        Message CodePostalCreateInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        CodePostalCreateInputMessage.setId("CodePostalCreateInputMessage");
        CodePostalCreateInputMessage.setFor("CodePostalCreateInput");
        CodePostalCreateInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(CodePostalCreateInputMessage);
        
        HtmlOutputText CityCreateOutput = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        CityCreateOutput.setId("CityCreateOutput");
        CityCreateOutput.setValue("City:   ");
        htmlPanelGrid.getChildren().add(CityCreateOutput);
        
        InputText CityCreateInput = (InputText) application.createComponent(InputText.COMPONENT_TYPE);
        CityCreateInput.setId("CityCreateInput");
        CityCreateInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{societeBean.societe.City}", String.class));
        htmlPanelGrid.getChildren().add(CityCreateInput);
        
        Message CityCreateInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        CityCreateInputMessage.setId("CityCreateInputMessage");
        CityCreateInputMessage.setFor("CityCreateInput");
        CityCreateInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(CityCreateInputMessage);
        
        HtmlOutputText EmailCreateOutput = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        EmailCreateOutput.setId("EmailCreateOutput");
        EmailCreateOutput.setValue("Email:   ");
        htmlPanelGrid.getChildren().add(EmailCreateOutput);
        
        InputText EmailCreateInput = (InputText) application.createComponent(InputText.COMPONENT_TYPE);
        EmailCreateInput.setId("EmailCreateInput");
        EmailCreateInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{societeBean.societe.Email}", String.class));
        htmlPanelGrid.getChildren().add(EmailCreateInput);
        
        Message EmailCreateInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        EmailCreateInputMessage.setId("EmailCreateInputMessage");
        EmailCreateInputMessage.setFor("EmailCreateInput");
        EmailCreateInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(EmailCreateInputMessage);
        
        HtmlOutputText PhoneNumberCreateOutput = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        PhoneNumberCreateOutput.setId("PhoneNumberCreateOutput");
        PhoneNumberCreateOutput.setValue("Phone Number:   ");
        htmlPanelGrid.getChildren().add(PhoneNumberCreateOutput);
        
        InputText PhoneNumberCreateInput = (InputText) application.createComponent(InputText.COMPONENT_TYPE);
        PhoneNumberCreateInput.setId("PhoneNumberCreateInput");
        PhoneNumberCreateInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{societeBean.societe.PhoneNumber}", String.class));
        htmlPanelGrid.getChildren().add(PhoneNumberCreateInput);
        
        Message PhoneNumberCreateInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        PhoneNumberCreateInputMessage.setId("PhoneNumberCreateInputMessage");
        PhoneNumberCreateInputMessage.setFor("PhoneNumberCreateInput");
        PhoneNumberCreateInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(PhoneNumberCreateInputMessage);
        
        HtmlOutputText FaxCreateOutput = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        FaxCreateOutput.setId("FaxCreateOutput");
        FaxCreateOutput.setValue("Fax:   ");
        htmlPanelGrid.getChildren().add(FaxCreateOutput);
        
        InputText FaxCreateInput = (InputText) application.createComponent(InputText.COMPONENT_TYPE);
        FaxCreateInput.setId("FaxCreateInput");
        FaxCreateInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{societeBean.societe.Fax}", String.class));
        htmlPanelGrid.getChildren().add(FaxCreateInput);
        
        Message FaxCreateInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        FaxCreateInputMessage.setId("FaxCreateInputMessage");
        FaxCreateInputMessage.setFor("FaxCreateInput");
        FaxCreateInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(FaxCreateInputMessage);
        
        HtmlOutputText WebPageCreateOutput = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        WebPageCreateOutput.setId("WebPageCreateOutput");
        WebPageCreateOutput.setValue("Web Page:   ");
        htmlPanelGrid.getChildren().add(WebPageCreateOutput);
        
        InputText WebPageCreateInput = (InputText) application.createComponent(InputText.COMPONENT_TYPE);
        WebPageCreateInput.setId("WebPageCreateInput");
        WebPageCreateInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{societeBean.societe.WebPage}", String.class));
        htmlPanelGrid.getChildren().add(WebPageCreateInput);
        
        Message WebPageCreateInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        WebPageCreateInputMessage.setId("WebPageCreateInputMessage");
        WebPageCreateInputMessage.setFor("WebPageCreateInput");
        WebPageCreateInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(WebPageCreateInputMessage);
        
        HtmlOutputText TVACreateOutput = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        TVACreateOutput.setId("TVACreateOutput");
        TVACreateOutput.setValue("T V A:   ");
        htmlPanelGrid.getChildren().add(TVACreateOutput);
        
        InputText TVACreateInput = (InputText) application.createComponent(InputText.COMPONENT_TYPE);
        TVACreateInput.setId("TVACreateInput");
        TVACreateInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{societeBean.societe.TVA}", BigDecimal.class));
        TVACreateInput.setRequired(false);
        htmlPanelGrid.getChildren().add(TVACreateInput);
        
        Message TVACreateInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        TVACreateInputMessage.setId("TVACreateInputMessage");
        TVACreateInputMessage.setFor("TVACreateInput");
        TVACreateInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(TVACreateInputMessage);
        
        return htmlPanelGrid;
    }
    
    public HtmlPanelGrid SocieteBean.populateEditPanel() {
        FacesContext facesContext = FacesContext.getCurrentInstance();
        Application application = facesContext.getApplication();
        ExpressionFactory expressionFactory = application.getExpressionFactory();
        ELContext elContext = facesContext.getELContext();
        
        HtmlPanelGrid htmlPanelGrid = (HtmlPanelGrid) application.createComponent(HtmlPanelGrid.COMPONENT_TYPE);
        
        HtmlOutputText NameEditOutput = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        NameEditOutput.setId("NameEditOutput");
        NameEditOutput.setValue("Name: * ");
        htmlPanelGrid.getChildren().add(NameEditOutput);
        
        InputText NameEditInput = (InputText) application.createComponent(InputText.COMPONENT_TYPE);
        NameEditInput.setId("NameEditInput");
        NameEditInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{societeBean.societe.Name}", String.class));
        htmlPanelGrid.getChildren().add(NameEditInput);
        
        Message NameEditInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        NameEditInputMessage.setId("NameEditInputMessage");
        NameEditInputMessage.setFor("NameEditInput");
        NameEditInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(NameEditInputMessage);
        
        HtmlOutputText AddressEditOutput = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        AddressEditOutput.setId("AddressEditOutput");
        AddressEditOutput.setValue("Address:   ");
        htmlPanelGrid.getChildren().add(AddressEditOutput);
        
        InputText AddressEditInput = (InputText) application.createComponent(InputText.COMPONENT_TYPE);
        AddressEditInput.setId("AddressEditInput");
        AddressEditInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{societeBean.societe.Address}", String.class));
        htmlPanelGrid.getChildren().add(AddressEditInput);
        
        Message AddressEditInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        AddressEditInputMessage.setId("AddressEditInputMessage");
        AddressEditInputMessage.setFor("AddressEditInput");
        AddressEditInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(AddressEditInputMessage);
        
        HtmlOutputText CodePostalEditOutput = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        CodePostalEditOutput.setId("CodePostalEditOutput");
        CodePostalEditOutput.setValue("Code Postal:   ");
        htmlPanelGrid.getChildren().add(CodePostalEditOutput);
        
        InputText CodePostalEditInput = (InputText) application.createComponent(InputText.COMPONENT_TYPE);
        CodePostalEditInput.setId("CodePostalEditInput");
        CodePostalEditInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{societeBean.societe.CodePostal}", String.class));
        htmlPanelGrid.getChildren().add(CodePostalEditInput);
        
        Message CodePostalEditInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        CodePostalEditInputMessage.setId("CodePostalEditInputMessage");
        CodePostalEditInputMessage.setFor("CodePostalEditInput");
        CodePostalEditInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(CodePostalEditInputMessage);
        
        HtmlOutputText CityEditOutput = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        CityEditOutput.setId("CityEditOutput");
        CityEditOutput.setValue("City:   ");
        htmlPanelGrid.getChildren().add(CityEditOutput);
        
        InputText CityEditInput = (InputText) application.createComponent(InputText.COMPONENT_TYPE);
        CityEditInput.setId("CityEditInput");
        CityEditInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{societeBean.societe.City}", String.class));
        htmlPanelGrid.getChildren().add(CityEditInput);
        
        Message CityEditInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        CityEditInputMessage.setId("CityEditInputMessage");
        CityEditInputMessage.setFor("CityEditInput");
        CityEditInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(CityEditInputMessage);
        
        HtmlOutputText EmailEditOutput = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        EmailEditOutput.setId("EmailEditOutput");
        EmailEditOutput.setValue("Email:   ");
        htmlPanelGrid.getChildren().add(EmailEditOutput);
        
        InputText EmailEditInput = (InputText) application.createComponent(InputText.COMPONENT_TYPE);
        EmailEditInput.setId("EmailEditInput");
        EmailEditInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{societeBean.societe.Email}", String.class));
        htmlPanelGrid.getChildren().add(EmailEditInput);
        
        Message EmailEditInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        EmailEditInputMessage.setId("EmailEditInputMessage");
        EmailEditInputMessage.setFor("EmailEditInput");
        EmailEditInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(EmailEditInputMessage);
        
        HtmlOutputText PhoneNumberEditOutput = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        PhoneNumberEditOutput.setId("PhoneNumberEditOutput");
        PhoneNumberEditOutput.setValue("Phone Number:   ");
        htmlPanelGrid.getChildren().add(PhoneNumberEditOutput);
        
        InputText PhoneNumberEditInput = (InputText) application.createComponent(InputText.COMPONENT_TYPE);
        PhoneNumberEditInput.setId("PhoneNumberEditInput");
        PhoneNumberEditInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{societeBean.societe.PhoneNumber}", String.class));
        htmlPanelGrid.getChildren().add(PhoneNumberEditInput);
        
        Message PhoneNumberEditInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        PhoneNumberEditInputMessage.setId("PhoneNumberEditInputMessage");
        PhoneNumberEditInputMessage.setFor("PhoneNumberEditInput");
        PhoneNumberEditInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(PhoneNumberEditInputMessage);
        
        HtmlOutputText FaxEditOutput = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        FaxEditOutput.setId("FaxEditOutput");
        FaxEditOutput.setValue("Fax:   ");
        htmlPanelGrid.getChildren().add(FaxEditOutput);
        
        InputText FaxEditInput = (InputText) application.createComponent(InputText.COMPONENT_TYPE);
        FaxEditInput.setId("FaxEditInput");
        FaxEditInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{societeBean.societe.Fax}", String.class));
        htmlPanelGrid.getChildren().add(FaxEditInput);
        
        Message FaxEditInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        FaxEditInputMessage.setId("FaxEditInputMessage");
        FaxEditInputMessage.setFor("FaxEditInput");
        FaxEditInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(FaxEditInputMessage);
        
        HtmlOutputText WebPageEditOutput = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        WebPageEditOutput.setId("WebPageEditOutput");
        WebPageEditOutput.setValue("Web Page:   ");
        htmlPanelGrid.getChildren().add(WebPageEditOutput);
        
        InputText WebPageEditInput = (InputText) application.createComponent(InputText.COMPONENT_TYPE);
        WebPageEditInput.setId("WebPageEditInput");
        WebPageEditInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{societeBean.societe.WebPage}", String.class));
        htmlPanelGrid.getChildren().add(WebPageEditInput);
        
        Message WebPageEditInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        WebPageEditInputMessage.setId("WebPageEditInputMessage");
        WebPageEditInputMessage.setFor("WebPageEditInput");
        WebPageEditInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(WebPageEditInputMessage);
        
        HtmlOutputText TVAEditOutput = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        TVAEditOutput.setId("TVAEditOutput");
        TVAEditOutput.setValue("T V A:   ");
        htmlPanelGrid.getChildren().add(TVAEditOutput);
        
        InputText TVAEditInput = (InputText) application.createComponent(InputText.COMPONENT_TYPE);
        TVAEditInput.setId("TVAEditInput");
        TVAEditInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{societeBean.societe.TVA}", BigDecimal.class));
        TVAEditInput.setRequired(false);
        htmlPanelGrid.getChildren().add(TVAEditInput);
        
        Message TVAEditInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        TVAEditInputMessage.setId("TVAEditInputMessage");
        TVAEditInputMessage.setFor("TVAEditInput");
        TVAEditInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(TVAEditInputMessage);
        
        return htmlPanelGrid;
    }
    
    public HtmlPanelGrid SocieteBean.populateViewPanel() {
        FacesContext facesContext = FacesContext.getCurrentInstance();
        Application application = facesContext.getApplication();
        ExpressionFactory expressionFactory = application.getExpressionFactory();
        ELContext elContext = facesContext.getELContext();
        
        HtmlPanelGrid htmlPanelGrid = (HtmlPanelGrid) application.createComponent(HtmlPanelGrid.COMPONENT_TYPE);
        
        HtmlOutputText NameLabel = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        NameLabel.setId("NameLabel");
        NameLabel.setValue("Name:   ");
        htmlPanelGrid.getChildren().add(NameLabel);
        
        HtmlOutputText NameValue = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        NameValue.setId("NameValue");
        NameValue.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{societeBean.societe.Name}", String.class));
        htmlPanelGrid.getChildren().add(NameValue);
        
        HtmlOutputText AddressLabel = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        AddressLabel.setId("AddressLabel");
        AddressLabel.setValue("Address:   ");
        htmlPanelGrid.getChildren().add(AddressLabel);
        
        HtmlOutputText AddressValue = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        AddressValue.setId("AddressValue");
        AddressValue.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{societeBean.societe.Address}", String.class));
        htmlPanelGrid.getChildren().add(AddressValue);
        
        HtmlOutputText CodePostalLabel = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        CodePostalLabel.setId("CodePostalLabel");
        CodePostalLabel.setValue("Code Postal:   ");
        htmlPanelGrid.getChildren().add(CodePostalLabel);
        
        HtmlOutputText CodePostalValue = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        CodePostalValue.setId("CodePostalValue");
        CodePostalValue.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{societeBean.societe.CodePostal}", String.class));
        htmlPanelGrid.getChildren().add(CodePostalValue);
        
        HtmlOutputText CityLabel = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        CityLabel.setId("CityLabel");
        CityLabel.setValue("City:   ");
        htmlPanelGrid.getChildren().add(CityLabel);
        
        HtmlOutputText CityValue = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        CityValue.setId("CityValue");
        CityValue.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{societeBean.societe.City}", String.class));
        htmlPanelGrid.getChildren().add(CityValue);
        
        HtmlOutputText EmailLabel = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        EmailLabel.setId("EmailLabel");
        EmailLabel.setValue("Email:   ");
        htmlPanelGrid.getChildren().add(EmailLabel);
        
        HtmlOutputText EmailValue = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        EmailValue.setId("EmailValue");
        EmailValue.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{societeBean.societe.Email}", String.class));
        htmlPanelGrid.getChildren().add(EmailValue);
        
        HtmlOutputText PhoneNumberLabel = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        PhoneNumberLabel.setId("PhoneNumberLabel");
        PhoneNumberLabel.setValue("Phone Number:   ");
        htmlPanelGrid.getChildren().add(PhoneNumberLabel);
        
        HtmlOutputText PhoneNumberValue = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        PhoneNumberValue.setId("PhoneNumberValue");
        PhoneNumberValue.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{societeBean.societe.PhoneNumber}", String.class));
        htmlPanelGrid.getChildren().add(PhoneNumberValue);
        
        HtmlOutputText FaxLabel = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        FaxLabel.setId("FaxLabel");
        FaxLabel.setValue("Fax:   ");
        htmlPanelGrid.getChildren().add(FaxLabel);
        
        HtmlOutputText FaxValue = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        FaxValue.setId("FaxValue");
        FaxValue.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{societeBean.societe.Fax}", String.class));
        htmlPanelGrid.getChildren().add(FaxValue);
        
        HtmlOutputText WebPageLabel = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        WebPageLabel.setId("WebPageLabel");
        WebPageLabel.setValue("Web Page:   ");
        htmlPanelGrid.getChildren().add(WebPageLabel);
        
        HtmlOutputText WebPageValue = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        WebPageValue.setId("WebPageValue");
        WebPageValue.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{societeBean.societe.WebPage}", String.class));
        htmlPanelGrid.getChildren().add(WebPageValue);
        
        HtmlOutputText TVALabel = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        TVALabel.setId("TVALabel");
        TVALabel.setValue("T V A:   ");
        htmlPanelGrid.getChildren().add(TVALabel);
        
        HtmlOutputText TVAValue = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        TVAValue.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{societeBean.societe.TVA}", String.class));
        htmlPanelGrid.getChildren().add(TVAValue);
        
        return htmlPanelGrid;
    }
    
    public Societe SocieteBean.getSociete() {
        if (societe == null) {
            societe = new Societe();
        }
        return societe;
    }
    
    public void SocieteBean.setSociete(Societe societe) {
        this.societe = societe;
    }
    
    public String SocieteBean.onEdit() {
        return null;
    }
    
    public boolean SocieteBean.isCreateDialogVisible() {
        return createDialogVisible;
    }
    
    public void SocieteBean.setCreateDialogVisible(boolean createDialogVisible) {
        this.createDialogVisible = createDialogVisible;
    }
    
    public String SocieteBean.displayList() {
        createDialogVisible = false;
        findAllSocietes();
        return "societe";
    }
    
    public String SocieteBean.displayCreateDialog() {
        societe = new Societe();
        createDialogVisible = true;
        return "societe";
    }
    
    public String SocieteBean.persist() {
        String message = "";
        if (societe.getId() != null) {
            societeService.updateSociete(societe);
            message = "Successfully updated";
        } else {
            societeService.saveSociete(societe);
            message = "Successfully created";
        }
        RequestContext context = RequestContext.getCurrentInstance();
        context.execute("createDialog.hide()");
        context.execute("editDialog.hide()");
        
        FacesMessage facesMessage = new FacesMessage(message);
        FacesContext.getCurrentInstance().addMessage(null, facesMessage);
        reset();
        return findAllSocietes();
    }
    
    public String SocieteBean.delete() {
        societeService.deleteSociete(societe);
        FacesMessage facesMessage = new FacesMessage("Successfully deleted");
        FacesContext.getCurrentInstance().addMessage(null, facesMessage);
        reset();
        return findAllSocietes();
    }
    
    public void SocieteBean.reset() {
        societe = null;
        createDialogVisible = false;
    }
    
    public void SocieteBean.handleDialogClose(CloseEvent event) {
        reset();
    }
    
}