<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="FrmLogin.aspx.cs" Inherits="FrmLogin" Title="Untitled Page" %>


<asp:Content ID="Content1" runat="server" 
    contentplaceholderid="ContentPlaceHolder1">
    <asp:Login ID="Login1" runat="server" BackColor="#F7F7DE" BorderColor="#CCCC99" 
    BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="10pt" 
    Orientation="Horizontal" DestinationPageUrl="~/FrmUser.aspx">
    <TitleTextStyle BackColor="#6B696B" Font-Bold="True" ForeColor="#FFFFFF" />
</asp:Login>




</asp:Content>
