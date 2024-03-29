// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.guymoyo.web;

import com.guymoyo.domain.Event;
import com.guymoyo.domain.UserAccount;
import com.guymoyo.service.EventService;
import com.guymoyo.service.UserAccountService;
import com.guymoyo.web.EventBean;
import com.guymoyo.web.converter.UserAccountConverter;
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
import javax.faces.validator.LengthValidator;
import org.primefaces.component.autocomplete.AutoComplete;
import org.primefaces.component.inputtext.InputText;
import org.primefaces.component.inputtextarea.InputTextarea;
import org.primefaces.component.message.Message;
import org.primefaces.context.RequestContext;
import org.primefaces.event.CloseEvent;
import org.springframework.beans.factory.annotation.Autowired;

privileged aspect EventBean_Roo_ManagedBean {
    
    declare @type: EventBean: @ManagedBean(name = "eventBean");
    
    declare @type: EventBean: @SessionScoped;
    
    @Autowired
    EventService EventBean.eventService;
    
    @Autowired
    UserAccountService EventBean.userAccountService;
    
    private String EventBean.name = "Events";
    
    private Event EventBean.event;
    
    private List<Event> EventBean.allEvents;
    
    private boolean EventBean.dataVisible = false;
    
    private List<String> EventBean.columns;
    
    private HtmlPanelGrid EventBean.createPanelGrid;
    
    private HtmlPanelGrid EventBean.editPanelGrid;
    
    private HtmlPanelGrid EventBean.viewPanelGrid;
    
    private boolean EventBean.createDialogVisible = false;
    
    @PostConstruct
    public void EventBean.init() {
        columns = new ArrayList<String>();
        columns.add("name");
        columns.add("description");
    }
    
    public String EventBean.getName() {
        return name;
    }
    
    public List<String> EventBean.getColumns() {
        return columns;
    }
    
    public List<Event> EventBean.getAllEvents() {
        return allEvents;
    }
    
    public void EventBean.setAllEvents(List<Event> allEvents) {
        this.allEvents = allEvents;
    }
    
    public String EventBean.findAllEvents() {
        allEvents = eventService.findAllEvents();
        dataVisible = !allEvents.isEmpty();
        return null;
    }
    
    public boolean EventBean.isDataVisible() {
        return dataVisible;
    }
    
    public void EventBean.setDataVisible(boolean dataVisible) {
        this.dataVisible = dataVisible;
    }
    
    public HtmlPanelGrid EventBean.getCreatePanelGrid() {
        if (createPanelGrid == null) {
            createPanelGrid = populateCreatePanel();
        }
        return createPanelGrid;
    }
    
    public void EventBean.setCreatePanelGrid(HtmlPanelGrid createPanelGrid) {
        this.createPanelGrid = createPanelGrid;
    }
    
    public HtmlPanelGrid EventBean.getEditPanelGrid() {
        if (editPanelGrid == null) {
            editPanelGrid = populateEditPanel();
        }
        return editPanelGrid;
    }
    
    public void EventBean.setEditPanelGrid(HtmlPanelGrid editPanelGrid) {
        this.editPanelGrid = editPanelGrid;
    }
    
    public HtmlPanelGrid EventBean.getViewPanelGrid() {
        return populateViewPanel();
    }
    
    public void EventBean.setViewPanelGrid(HtmlPanelGrid viewPanelGrid) {
        this.viewPanelGrid = viewPanelGrid;
    }
    
    public HtmlPanelGrid EventBean.populateCreatePanel() {
        FacesContext facesContext = FacesContext.getCurrentInstance();
        Application application = facesContext.getApplication();
        ExpressionFactory expressionFactory = application.getExpressionFactory();
        ELContext elContext = facesContext.getELContext();
        
        HtmlPanelGrid htmlPanelGrid = (HtmlPanelGrid) application.createComponent(HtmlPanelGrid.COMPONENT_TYPE);
        
        HtmlOutputText nameCreateOutput = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        nameCreateOutput.setId("nameCreateOutput");
        nameCreateOutput.setValue("Name: * ");
        htmlPanelGrid.getChildren().add(nameCreateOutput);
        
        InputText nameCreateInput = (InputText) application.createComponent(InputText.COMPONENT_TYPE);
        nameCreateInput.setId("nameCreateInput");
        nameCreateInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{eventBean.event.name}", String.class));
        htmlPanelGrid.getChildren().add(nameCreateInput);
        
        Message nameCreateInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        nameCreateInputMessage.setId("nameCreateInputMessage");
        nameCreateInputMessage.setFor("nameCreateInput");
        nameCreateInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(nameCreateInputMessage);
        
        HtmlOutputText descriptionCreateOutput = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        descriptionCreateOutput.setId("descriptionCreateOutput");
        descriptionCreateOutput.setValue("Description: * ");
        htmlPanelGrid.getChildren().add(descriptionCreateOutput);
        
        InputTextarea descriptionCreateInput = (InputTextarea) application.createComponent(InputTextarea.COMPONENT_TYPE);
        descriptionCreateInput.setId("descriptionCreateInput");
        descriptionCreateInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{eventBean.event.description}", String.class));
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
        createdByCreateInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{eventBean.event.createdBy}", UserAccount.class));
        createdByCreateInput.setCompleteMethod(expressionFactory.createMethodExpression(elContext, "#{eventBean.completeCreatedBy}", List.class, new Class[] { String.class }));
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
    
    public HtmlPanelGrid EventBean.populateEditPanel() {
        FacesContext facesContext = FacesContext.getCurrentInstance();
        Application application = facesContext.getApplication();
        ExpressionFactory expressionFactory = application.getExpressionFactory();
        ELContext elContext = facesContext.getELContext();
        
        HtmlPanelGrid htmlPanelGrid = (HtmlPanelGrid) application.createComponent(HtmlPanelGrid.COMPONENT_TYPE);
        
        HtmlOutputText nameEditOutput = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        nameEditOutput.setId("nameEditOutput");
        nameEditOutput.setValue("Name: * ");
        htmlPanelGrid.getChildren().add(nameEditOutput);
        
        InputText nameEditInput = (InputText) application.createComponent(InputText.COMPONENT_TYPE);
        nameEditInput.setId("nameEditInput");
        nameEditInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{eventBean.event.name}", String.class));
        htmlPanelGrid.getChildren().add(nameEditInput);
        
        Message nameEditInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        nameEditInputMessage.setId("nameEditInputMessage");
        nameEditInputMessage.setFor("nameEditInput");
        nameEditInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(nameEditInputMessage);
        
        HtmlOutputText descriptionEditOutput = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        descriptionEditOutput.setId("descriptionEditOutput");
        descriptionEditOutput.setValue("Description: * ");
        htmlPanelGrid.getChildren().add(descriptionEditOutput);
        
        InputTextarea descriptionEditInput = (InputTextarea) application.createComponent(InputTextarea.COMPONENT_TYPE);
        descriptionEditInput.setId("descriptionEditInput");
        descriptionEditInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{eventBean.event.description}", String.class));
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
        createdByEditInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{eventBean.event.createdBy}", UserAccount.class));
        createdByEditInput.setCompleteMethod(expressionFactory.createMethodExpression(elContext, "#{eventBean.completeCreatedBy}", List.class, new Class[] { String.class }));
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
    
    public HtmlPanelGrid EventBean.populateViewPanel() {
        FacesContext facesContext = FacesContext.getCurrentInstance();
        Application application = facesContext.getApplication();
        ExpressionFactory expressionFactory = application.getExpressionFactory();
        ELContext elContext = facesContext.getELContext();
        
        HtmlPanelGrid htmlPanelGrid = (HtmlPanelGrid) application.createComponent(HtmlPanelGrid.COMPONENT_TYPE);
        
        HtmlOutputText nameLabel = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        nameLabel.setId("nameLabel");
        nameLabel.setValue("Name:   ");
        htmlPanelGrid.getChildren().add(nameLabel);
        
        HtmlOutputText nameValue = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        nameValue.setId("nameValue");
        nameValue.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{eventBean.event.name}", String.class));
        htmlPanelGrid.getChildren().add(nameValue);
        
        HtmlOutputText descriptionLabel = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        descriptionLabel.setId("descriptionLabel");
        descriptionLabel.setValue("Description:   ");
        htmlPanelGrid.getChildren().add(descriptionLabel);
        
        InputTextarea descriptionValue = (InputTextarea) application.createComponent(InputTextarea.COMPONENT_TYPE);
        descriptionValue.setId("descriptionValue");
        descriptionValue.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{eventBean.event.description}", String.class));
        descriptionValue.setReadonly(true);
        descriptionValue.setDisabled(true);
        htmlPanelGrid.getChildren().add(descriptionValue);
        
        HtmlOutputText createdByLabel = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        createdByLabel.setId("createdByLabel");
        createdByLabel.setValue("Created By:   ");
        htmlPanelGrid.getChildren().add(createdByLabel);
        
        HtmlOutputText createdByValue = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        createdByValue.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{eventBean.event.createdBy}", UserAccount.class));
        createdByValue.setConverter(new UserAccountConverter());
        htmlPanelGrid.getChildren().add(createdByValue);
        
        return htmlPanelGrid;
    }
    
    public Event EventBean.getEvent() {
        if (event == null) {
            event = new Event();
        }
        return event;
    }
    
    public void EventBean.setEvent(Event event) {
        this.event = event;
    }
    
    public List<UserAccount> EventBean.completeCreatedBy(String query) {
        List<UserAccount> suggestions = new ArrayList<UserAccount>();
        for (UserAccount userAccount : userAccountService.findAllUserAccounts()) {
            String userAccountStr = String.valueOf(userAccount.getUsername() +  " "  + userAccount.getPassword() +  " "  + userAccount.getFirstName() +  " "  + userAccount.getLastName());
            if (userAccountStr.toLowerCase().startsWith(query.toLowerCase())) {
                suggestions.add(userAccount);
            }
        }
        return suggestions;
    }
    
    public String EventBean.onEdit() {
        return null;
    }
    
    public boolean EventBean.isCreateDialogVisible() {
        return createDialogVisible;
    }
    
    public void EventBean.setCreateDialogVisible(boolean createDialogVisible) {
        this.createDialogVisible = createDialogVisible;
    }
    
    public String EventBean.displayList() {
        createDialogVisible = false;
        findAllEvents();
        return "event";
    }
    
    public String EventBean.displayCreateDialog() {
        event = new Event();
        createDialogVisible = true;
        return "event";
    }
    
    public String EventBean.persist() {
        String message = "";
        if (event.getId() != null) {
            eventService.updateEvent(event);
            message = "Successfully updated";
        } else {
            eventService.saveEvent(event);
            message = "Successfully created";
        }
        RequestContext context = RequestContext.getCurrentInstance();
        context.execute("createDialog.hide()");
        context.execute("editDialog.hide()");
        
        FacesMessage facesMessage = new FacesMessage(message);
        FacesContext.getCurrentInstance().addMessage(null, facesMessage);
        reset();
        return findAllEvents();
    }
    
    public String EventBean.delete() {
        eventService.deleteEvent(event);
        FacesMessage facesMessage = new FacesMessage("Successfully deleted");
        FacesContext.getCurrentInstance().addMessage(null, facesMessage);
        reset();
        return findAllEvents();
    }
    
    public void EventBean.reset() {
        event = null;
        createDialogVisible = false;
    }
    
    public void EventBean.handleDialogClose(CloseEvent event) {
        reset();
    }
    
}
