﻿<%@ Control Language="VB" CodeBehind="Enumeration.ascx.vb" Inherits="QLHS.EnumerationFilter" %>

<asp:DropDownList runat="server" ID="DropDownList1" AutoPostBack="True" CssClass="DDFilter"
    OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
  <asp:ListItem Text="All" Value="" />
</asp:DropDownList>

