<%@ Page Language="C#" MasterPageFile="~/MasterPage3.master" AutoEventWireup="true" CodeFile="FrmUser.aspx.cs" Inherits="FrmUser" Title="Untitled Page" %>

<%@ Register assembly="Anthem" namespace="Anthem" tagprefix="anthem" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width: 100%">
        <tr>
            <td class="subheader" 
                
                style="font-size: medium; font-weight: 900; font-style: normal; font-variant: normal; text-transform: capitalize; color: #FFFFFF" 
                bgcolor="#2D2D2B">
                Welcome
                <anthem:Label ID="LblUserId" runat="server"></anthem:Label>
            </td>
        </tr>
    </table>
    <table style="width: 100%">
        <tr>
            <td style="width: 355px">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td align="right" style="width: 355px">
    <anthem:Button ID="BtnStartTest" runat="server" 
    onclick="BtnStartTest_Click" Text="Start Quiz" ToolTip="Start Quiz" />
            </td>
            <td>
                &nbsp;</td>
        </tr>
</table>
</asp:Content>

