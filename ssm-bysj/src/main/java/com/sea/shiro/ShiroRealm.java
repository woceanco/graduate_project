package com.sea.shiro;

import com.sea.pojo.Role;
import com.sea.pojo.User;
import com.sea.service.RoleService;
import com.sea.service.UserService;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;

public class ShiroRealm extends AuthorizingRealm {

    @Autowired
    private UserService userService;
    @Autowired
    private RoleService roleService;

    //认证
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {

        System.out.println("ShiroRealm----doGetAuthenticationInfo-----");
        UsernamePasswordToken token = (UsernamePasswordToken) authenticationToken;
        String loginName = token.getUsername();
        String password = String.valueOf(token.getPassword());
        User user = userService.queryByLoginName(loginName);
        if (user == null) {
            throw new UnknownAccountException();
        }

        SimpleAuthenticationInfo authenticationInfo = new SimpleAuthenticationInfo(loginName,user.getPassword(),this.getName());
        return authenticationInfo;
    }

    //授权
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {

        System.out.println("ShiroRealm-----doGetAuthorizationInfo----");
        String loginName = (String) principalCollection.getPrimaryPrincipal();
        User user = userService.queryByLoginName(loginName);

        Role role = roleService.selectRoleByUser(user.getUserId());
        //添加角色和权限
        SimpleAuthorizationInfo simpleAuthorizationInfo = new SimpleAuthorizationInfo();
        simpleAuthorizationInfo.addRole(role.getRoleKey());
        return simpleAuthorizationInfo;
    }

}
