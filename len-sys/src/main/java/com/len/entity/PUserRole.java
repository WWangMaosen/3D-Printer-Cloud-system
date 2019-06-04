package com.len.entity;

import lombok.Data;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;

@Data
@Table(name ="p_user_role")
public class PUserRole {

  @Id
  @Column(name="p_user")
  private String pUser;
  @Column(name="p_role")
  private String pRole;


  public String getPUser() {
    return pUser;
  }

  public void setPUser(String pUser) {
    this.pUser = pUser;
  }


  public String getPRole() {
    return pRole;
  }

  public void setPRole(String pRole) {
    this.pRole = pRole;
  }

}
