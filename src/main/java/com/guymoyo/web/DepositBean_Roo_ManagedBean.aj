// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.guymoyo.web;

import com.guymoyo.domain.Deposit;
import com.guymoyo.domain.UserAccount;
import com.guymoyo.service.DepositService;
import com.guymoyo.service.UserAccountService;
import com.guymoyo.web.DepositBean;
import com.guymoyo.web.converter.UserAccountConverter;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
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
import javax.faces.validator.LengthValidator;
import org.primefaces.component.autocomplete.AutoComplete;
import org.primefaces.component.calendar.Calendar;
import org.primefaces.component.inputtext.InputText;
import org.primefaces.component.inputtextarea.InputTextarea;
import org.primefaces.component.message.Message;
import org.primefaces.context.RequestContext;
import org.primefaces.event.CloseEvent;
import org.springframework.beans.factory.annotation.Autowired;

privileged aspect DepositBean_Roo_ManagedBean {
    
    declare @type: DepositBean: @ManagedBean(name = "depositBean");
    
    declare @type: DepositBean: @SessionScoped;
    
    @Autowired
    DepositService DepositBean.depositService;
    
    @Autowired
    UserAccountService DepositBean.userAccountService;
    
    private String DepositBean.name = "Deposits";
    
    private Deposit DepositBean.deposit;
    
    private List<Deposit> DepositBean.allDeposits;
    
    private boolean DepositBean.dataVisible = false;
    
    private List<String> DepositBean.columns;
    
    private HtmlPanelGrid DepositBean.createPanelGrid;
    
    private HtmlPanelGrid DepositBean.editPanelGrid;
    
    private HtmlPanelGrid DepositBean.viewPanelGrid;
    
    private boolean DepositBean.createDialogVisible = false;
    
    @PostConstruct
    public void DepositBean.init() {
        columns = new ArrayList<String>();
        columns.add("montant");
        columns.add("dateOfCreation");
        columns.add("description");
    }
    
    public String DepositBean.getName() {
        return name;
    }
    
    public List<String> DepositBean.getColumns() {
        return columns;
    }
    
    public List<Deposit> DepositBean.getAllDeposits() {
        return allDeposits;
    }
    
    public void DepositBean.setAllDeposits(List<Deposit> allDeposits) {
        this.allDeposits = allDeposits;
    }
    
    public String DepositBean.findAllDeposits() {
        allDeposits = depositService.findAllDeposits();
        dataVisible = !allDeposits.isEmpty();
        return null;
    }
    
    public boolean DepositBean.isDataVisible() {
        return dataVisible;
    }
    
    public void DepositBean.setDataVisible(boolean dataVisible) {
        this.dataVisible = dataVisible;
    }
    
    public HtmlPanelGrid DepositBean.getCreatePanelGrid() {
        if (createPanelGrid == null) {
            createPanelGrid = populateCreatePanel();
        }
        return createPanelGrid;
    }
    
    public void DepositBean.setCreatePanelGrid(HtmlPanelGrid createPanelGrid) {
        this.createPanelGrid = createPanelGrid;
    }
    
    public HtmlPanelGrid DepositBean.getEditPanelGrid() {
        if (editPanelGrid == null) {
            editPanelGrid = populateEditPanel();
        }
        return editPanelGrid;
    }
    
    public void DepositBean.setEditPanelGrid(HtmlPanelGrid editPanelGrid) {
        this.editPanelGrid = editPanelGrid;
    }
    
    public HtmlPanelGrid DepositBean.getViewPanelGrid() {
        return populateViewPanel();
    }
    
    public void DepositBean.setViewPanelGrid(HtmlPanelGrid viewPanelGrid) {
        this.viewPanelGrid = viewPanelGrid;
    }
    
    public HtmlPanelGrid DepositBean.populateCreatePanel() {
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
        userAccountCreateInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{depositBean.deposit.userAccount}", UserAccount.class));
        userAccountCreateInput.setCompleteMethod(expressionFactory.createMethodExpression(elContext, "#{depositBean.completeUserAccount}", List.class, new Class[] { String.class }));
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
        
        HtmlOutputText montantCreateOutput = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        montantCreateOutput.setId("montantCreateOutput");
        montantCreateOutput.setValue("Montant: * ");
        htmlPanelGrid.getChildren().add(montantCreateOutput);
        
        InputText montantCreateInput = (InputText) application.createComponent(InputText.COMPONENT_TYPE);
        montantCreateInput.setId("montantCreateInput");
        montantCreateInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{depositBean.deposit.montant}", BigDecimal.class));
        montantCreateInput.setRequired(true);
        htmlPanelGrid.getChildren().add(montantCreateInput);
        
        Message montantCreateInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        montantCreateInputMessage.setId("montantCreateInputMessage");
        montantCreateInputMessage.setFor("montantCreateInput");
        montantCreateInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(montantCreateInputMessage);
        
        HtmlOutputText dateOfCreationCreateOutput = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        dateOfCreationCreateOutput.setId("dateOfCreationCreateOutput");
        dateOfCreationCreateOutput.setValue("Date Of Creation:   ");
        htmlPanelGrid.getChildren().add(dateOfCreationCreateOutput);
        
        Calendar dateOfCreationCreateInput = (Calendar) application.createComponent(Calendar.COMPONENT_TYPE);
        dateOfCreationCreateInput.setId("dateOfCreationCreateInput");
        dateOfCreationCreateInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{depositBean.deposit.dateOfCreation}", Date.class));
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
        
        HtmlOutputText descriptionCreateOutput = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        descriptionCreateOutput.setId("descriptionCreateOutput");
        descriptionCreateOutput.setValue("Description: * ");
        htmlPanelGrid.getChildren().add(descriptionCreateOutput);
        
        InputTextarea descriptionCreateInput = (InputTextarea) application.createComponent(InputTextarea.COMPONENT_TYPE);
        descriptionCreateInput.setId("descriptionCreateInput");
        descriptionCreateInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{depositBean.deposit.description}", String.class));
        LengthValidator descriptionCreateInputValidator = new LengthValidator();
        descriptionCreateInputValidator.setMaximum(255);
        descriptionCreateInput.addValidator(descriptionCreateInputValidator);
        descriptionCreateInput.setRequired(true);
        htmlPanelGrid.getChildren().add(descriptionCreateInput);
        
        Message descriptionCreateInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        descriptionCreateInputMessage.setId("descriptionCreateInputMessage");
        descriptionCreateInputMessage.setFor("descriptionCreateInput");
        descriptionCreateInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(descriptionCreateInputMessage);
        
        HtmlOutputText createdByCreateOutput = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        createdByCreateOutput.setId("createdByCreateOutput");
        createdByCreateOutput.setValue("Created By:   ");
        htmlPanelGrid.getChildren().add(createdByCreateOutput);
        
        AutoComplete createdByCreateInput = (AutoComplete) application.createComponent(AutoComplete.COMPONENT_TYPE);
        createdByCreateInput.setId("createdByCreateInput");
        createdByCreateInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{depositBean.deposit.createdBy}", UserAccount.class));
        createdByCreateInput.setCompleteMethod(expressionFactory.createMethodExpression(elContext, "#{depositBean.completeCreatedBy}", List.class, new Class[] { String.class }));
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
    
    public HtmlPanelGrid DepositBean.populateEditPanel() {
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
        userAccountEditInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{depositBean.deposit.userAccount}", UserAccount.class));
        userAccountEditInput.setCompleteMethod(expressionFactory.createMethodExpression(elContext, "#{depositBean.completeUserAccount}", List.class, new Class[] { String.class }));
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
        
        HtmlOutputText montantEditOutput = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        montantEditOutput.setId("montantEditOutput");
        montantEditOutput.setValue("Montant: * ");
        htmlPanelGrid.getChildren().add(montantEditOutput);
        
        InputText montantEditInput = (InputText) application.createComponent(InputText.COMPONENT_TYPE);
        montantEditInput.setId("montantEditInput");
        montantEditInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{depositBean.deposit.montant}", BigDecimal.class));
        montantEditInput.setRequired(true);
        htmlPanelGrid.getChildren().add(montantEditInput);
        
        Message montantEditInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        montantEditInputMessage.setId("montantEditInputMessage");
        montantEditInputMessage.setFor("montantEditInput");
        montantEditInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(montantEditInputMessage);
        
        HtmlOutputText dateOfCreationEditOutput = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        dateOfCreationEditOutput.setId("dateOfCreationEditOutput");
        dateOfCreationEditOutput.setValue("Date Of Creation:   ");
        htmlPanelGrid.getChildren().add(dateOfCreationEditOutput);
        
        Calendar dateOfCreationEditInput = (Calendar) application.createComponent(Calendar.COMPONENT_TYPE);
        dateOfCreationEditInput.setId("dateOfCreationEditInput");
        dateOfCreationEditInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{depositBean.deposit.dateOfCreation}", Date.class));
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
        
        HtmlOutputText descriptionEditOutput = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        descriptionEditOutput.setId("descriptionEditOutput");
        descriptionEditOutput.setValue("Description: * ");
        htmlPanelGrid.getChildren().add(descriptionEditOutput);
        
        InputTextarea descriptionEditInput = (InputTextarea) application.createComponent(InputTextarea.COMPONENT_TYPE);
        descriptionEditInput.setId("descriptionEditInput");
        descriptionEditInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{depositBean.deposit.description}", String.class));
        LengthValidator descriptionEditInputValidator = new LengthValidator();
        descriptionEditInputValidator.setMaximum(255);
        descriptionEditInput.addValidator(descriptionEditInputValidator);
        descriptionEditInput.setRequired(true);
        htmlPanelGrid.getChildren().add(descriptionEditInput);
        
        Message descriptionEditInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        descriptionEditInputMessage.setId("descriptionEditInputMessage");
        descriptionEditInputMessage.setFor("descriptionEditInput");
        descriptionEditInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(descriptionEditInputMessage);
        
        HtmlOutputText createdByEditOutput = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        createdByEditOutput.setId("createdByEditOutput");
        createdByEditOutput.setValue("Created By:   ");
        htmlPanelGrid.getChildren().add(createdByEditOutput);
        
        AutoComplete createdByEditInput = (AutoComplete) application.createComponent(AutoComplete.COMPONENT_TYPE);
        createdByEditInput.setId("createdByEditInput");
        createdByEditInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{depositBean.deposit.createdBy}", UserAccount.class));
        createdByEditInput.setCompleteMethod(expressionFactory.createMethodExpression(elContext, "#{depositBean.completeCreatedBy}", List.class, new Class[] { String.class }));
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
    
    public HtmlPanelGrid DepositBean.populateViewPanel() {
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
        userAccountValue.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{depositBean.deposit.userAccount}", UserAccount.class));
        userAccountValue.setConverter(new UserAccountConverter());
        htmlPanelGrid.getChildren().add(userAccountValue);
        
        HtmlOutputText montantLabel = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        montantLabel.setId("montantLabel");
        montantLabel.setValue("Montant:   ");
        htmlPanelGrid.getChildren().add(montantLabel);
        
        HtmlOutputText montantValue = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        montantValue.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{depositBean.deposit.montant}", String.class));
        htmlPanelGrid.getChildren().add(montantValue);
        
        HtmlOutputText dateOfCreationLabel = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        dateOfCreationLabel.setId("dateOfCreationLabel");
        dateOfCreationLabel.setValue("Date Of Creation:   ");
        htmlPanelGrid.getChildren().add(dateOfCreationLabel);
        
        HtmlOutputText dateOfCreationValue = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        dateOfCreationValue.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{depositBean.deposit.dateOfCreation}", Date.class));
        DateTimeConverter dateOfCreationValueConverter = (DateTimeConverter) application.createConverter(DateTimeConverter.CONVERTER_ID);
        dateOfCreationValueConverter.setPattern("dd/MM/yyyy");
        dateOfCreationValue.setConverter(dateOfCreationValueConverter);
        htmlPanelGrid.getChildren().add(dateOfCreationValue);
        
        HtmlOutputText descriptionLabel = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        descriptionLabel.setId("descriptionLabel");
        descriptionLabel.setValue("Description:   ");
        htmlPanelGrid.getChildren().add(descriptionLabel);
        
        InputTextarea descriptionValue = (InputTextarea) application.createComponent(InputTextarea.COMPONENT_TYPE);
        descriptionValue.setId("descriptionValue");
        descriptionValue.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{depositBean.deposit.description}", String.class));
        descriptionValue.setReadonly(true);
        descriptionValue.setDisabled(true);
        htmlPanelGrid.getChildren().add(descriptionValue);
        
        HtmlOutputText createdByLabel = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        createdByLabel.setId("createdByLabel");
        createdByLabel.setValue("Created By:   ");
        htmlPanelGrid.getChildren().add(createdByLabel);
        
        HtmlOutputText createdByValue = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        createdByValue.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{depositBean.deposit.createdBy}", UserAccount.class));
        createdByValue.setConverter(new UserAccountConverter());
        htmlPanelGrid.getChildren().add(createdByValue);
        
        return htmlPanelGrid;
    }
    
    public Deposit DepositBean.getDeposit() {
        if (deposit == null) {
            deposit = new Deposit();
        }
        return deposit;
    }
    
    public void DepositBean.setDeposit(Deposit deposit) {
        this.deposit = deposit;
    }
    
    public List<UserAccount> DepositBean.completeUserAccount(String query) {
        List<UserAccount> suggestions = new ArrayList<UserAccount>();
        for (UserAccount userAccount : userAccountService.findAllUserAccounts()) {
            String userAccountStr = String.valueOf(userAccount.getUsername() +  " "  + userAccount.getPassword() +  " "  + userAccount.getFirstName() +  " "  + userAccount.getLastName());
            if (userAccountStr.toLowerCase().startsWith(query.toLowerCase())) {
                suggestions.add(userAccount);
            }
        }
        return suggestions;
    }
    
    public List<UserAccount> DepositBean.completeCreatedBy(String query) {
        List<UserAccount> suggestions = new ArrayList<UserAccount>();
        for (UserAccount userAccount : userAccountService.findAllUserAccounts()) {
            String userAccountStr = String.valueOf(userAccount.getUsername() +  " "  + userAccount.getPassword() +  " "  + userAccount.getFirstName() +  " "  + userAccount.getLastName());
            if (userAccountStr.toLowerCase().startsWith(query.toLowerCase())) {
                suggestions.add(userAccount);
            }
        }
        return suggestions;
    }
    
    public String DepositBean.onEdit() {
        return null;
    }
    
    public boolean DepositBean.isCreateDialogVisible() {
        return createDialogVisible;
    }
    
    public void DepositBean.setCreateDialogVisible(boolean createDialogVisible) {
        this.createDialogVisible = createDialogVisible;
    }
    
    public String DepositBean.displayList() {
        createDialogVisible = false;
        findAllDeposits();
        return "deposit";
    }
    
    public String DepositBean.displayCreateDialog() {
        deposit = new Deposit();
        createDialogVisible = true;
        return "deposit";
    }
    
    public String DepositBean.persist() {
        String message = "";
        if (deposit.getId() != null) {
            depositService.updateDeposit(deposit);
            message = "Successfully updated";
        } else {
            depositService.saveDeposit(deposit);
            message = "Successfully created";
        }
        RequestContext context = RequestContext.getCurrentInstance();
        context.execute("createDialog.hide()");
        context.execute("editDialog.hide()");
        
        FacesMessage facesMessage = new FacesMessage(message);
        FacesContext.getCurrentInstance().addMessage(null, facesMessage);
        reset();
        return findAllDeposits();
    }
    
    public String DepositBean.delete() {
        depositService.deleteDeposit(deposit);
        FacesMessage facesMessage = new FacesMessage("Successfully deleted");
        FacesContext.getCurrentInstance().addMessage(null, facesMessage);
        reset();
        return findAllDeposits();
    }
    
    public void DepositBean.reset() {
        deposit = null;
        createDialogVisible = false;
    }
    
    public void DepositBean.handleDialogClose(CloseEvent event) {
        reset();
    }
    
}
