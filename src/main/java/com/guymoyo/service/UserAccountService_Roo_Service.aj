// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.guymoyo.service;

import com.guymoyo.domain.UserAccount;
import com.guymoyo.service.UserAccountService;
import java.util.List;

privileged aspect UserAccountService_Roo_Service {
    
    public abstract long UserAccountService.countAllUserAccounts();    
    public abstract void UserAccountService.deleteUserAccount(UserAccount userAccount);    
    public abstract UserAccount UserAccountService.findUserAccount(Long id);    
    public abstract List<UserAccount> UserAccountService.findAllUserAccounts();    
    public abstract List<UserAccount> UserAccountService.findUserAccountEntries(int firstResult, int maxResults);    
    public abstract void UserAccountService.saveUserAccount(UserAccount userAccount);    
    public abstract UserAccount UserAccountService.updateUserAccount(UserAccount userAccount);    
}