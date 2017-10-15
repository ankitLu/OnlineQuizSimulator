<%@ Page Language="C#" MasterPageFile="~/MasterPage3.master" AutoEventWireup="true" CodeFile="FrmSelectQuiz.aspx.cs" Inherits="FrmSelectQuiz" Title="Untitled Page" %>

<%@ Register assembly="Anthem" namespace="Anthem" tagprefix="anthem" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width: 100%">
        <tr>
            <td bgcolor="#7C1616" 
                style="font-size: medium; font-weight: 900; font-style: normal; font-variant: normal; text-transform: capitalize; color: #FFFFFF">
                Please select the Quiz</td>
        </tr>
    </table>
    <table style="width: 100%">
        <tr>
            <td align="center" style="width: 408px">
    <anthem:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" 
                    style="margin-left: 0px" Width="416px">
    <ItemTemplate>
        <anthem:HyperLink ID="HyperLink1" runat="server" 
            NavigateUrl='<%# "FrmUser.aspx?testid="+Eval("Quizid") %>' 
            Text='<%# Eval("Title") %>' BackColor="#0066FF" Font-Size="Large">
            &nbsp;</anthem:HyperLink>
        <br />
        <br />
        <anthem:Label ID="Label1" runat="server" Text='<%# Eval("Description") %>' 
            Font-Size="Small">
            &nbsp;</anthem:Label>
    </ItemTemplate>
</anthem:DataList>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 408px">
<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
    ConnectionString="<%$ ConnectionStrings:Quiz2ConnectionString2 %>" 
    SelectCommand="SELECT * FROM [Quiz]"></asp:SqlDataSource>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 408px">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 408px">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

