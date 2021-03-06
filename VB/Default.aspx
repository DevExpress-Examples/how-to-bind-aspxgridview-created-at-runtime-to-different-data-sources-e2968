﻿<%@ Page Language="vb" AutoEventWireup="true" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<%@ Register Assembly="DevExpress.Web.v16.2, Version=16.2.17.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web" TagPrefix="dx" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>How to bind ASPxGridView with autocreated columns to different data sources at runtime. The grid is created in runtime mode</title>
</head>
<body>
    <form id="form1" runat="server">
        <table>
            <tr>
                <td valign="top">
                    <asp:PlaceHolder ID="phGrid" runat="server"></asp:PlaceHolder>
                </td>
                <td valign="top">
                    <dx:ASPxRadioButtonList ID="rblDatasources" runat="server">
                        <ClientSideEvents SelectedIndexChanged="function(s, e) { grid.PerformCallback(s.GetSelectedIndex()); }" />
                        <Items>
                            <dx:ListEditItem Selected="True" Text="Products" />
                            <dx:ListEditItem Text="Categories" />
                            <dx:ListEditItem Text="Shippers" />
                        </Items>
                    </dx:ASPxRadioButtonList>
                </td>
            </tr>
        </table>
        <asp:SqlDataSource ID="dsProducts" runat="server" ConnectionString="Data Source=(local);Initial Catalog=Northwind;Integrated Security=True"
            ProviderName="System.Data.SqlClient" SelectCommand="SELECT [ProductID], [ProductName], [QuantityPerUnit], [UnitPrice] FROM [Products]">                        
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="dsCategories" runat="server" ConnectionString="Data Source=(local);Initial Catalog=Northwind;Integrated Security=True"
            ProviderName="System.Data.SqlClient"             SelectCommand="SELECT [CategoryID], [CategoryName], [Description] FROM [Categories]">                        
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="dsShippers" runat="server" ConnectionString="Data Source=(local);Initial Catalog=Northwind;Integrated Security=True"
            ProviderName="System.Data.SqlClient" SelectCommand="SELECT [ShipperID], [CompanyName], [Phone] FROM [Shippers]">
        </asp:SqlDataSource>
    </form>
</body>
</html>