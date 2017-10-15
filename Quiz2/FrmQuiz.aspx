<%@ Page Language="C#" MasterPageFile="~/MasterPage3.master" AutoEventWireup="true" CodeFile="FrmQuiz.aspx.cs" Inherits="FrmQuiz" Title="Untitled Page" %>

<%@ Register assembly="Anthem" namespace="Anthem" tagprefix="anthem" %>

<asp:Content ID="Content1" runat="server" 
    contentplaceholderid="ContentPlaceHolder1">
    <table style="width: 100%">
    <tr>
        <td bgcolor="#2C2C2C" 
                
            style="font-size: medium; font-style: normal; font-weight: 900; font-variant: normal; text-transform: capitalize; color: #FFFFFF">
            User Quiz</td>
    </tr>
</table>
<table style="width: 100%">
    <tr>
        <td align="center">
            <anthem:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
                    BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" 
                    CellPadding="3" CellSpacing="2" DataKeyNames="QuestionID" 
                    DataSourceID="SqlDataSource1" Font-Bold="True" Font-Size="Medium" 
                    Height="153px" ToolTip="Question" UpdateAfterCallBack="True" 
                Width="617px">
                <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                <Fields>
                    <asp:BoundField DataField="Title" HeaderText="Ques Title" 
                            SortExpression="Title">
                        <HeaderStyle BackColor="#FFB966" Font-Bold="True" Font-Size="Larger" 
                                ForeColor="Black" />
                        <ItemStyle BackColor="#FFB966" Font-Size="Large" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Answer1" HeaderText="Answer1" 
                            SortExpression="Answer1">
                        <HeaderStyle Font-Size="Medium" />
                        <ItemStyle Font-Size="Medium" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Answer2" HeaderText="Answer2" 
                            SortExpression="Answer2">
                        <HeaderStyle Font-Size="Medium" />
                        <ItemStyle Font-Size="Medium" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Answer3" HeaderText="Answer3" 
                            SortExpression="Answer3">
                        <HeaderStyle Font-Size="Medium" />
                        <ItemStyle Font-Size="Medium" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Answer4" HeaderText="Answer4" 
                            SortExpression="Answer4">
                        <HeaderStyle Font-Size="Medium" />
                        <ItemStyle Font-Size="Medium" />
                    </asp:BoundField>
                </Fields>
                <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                <EditRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
            </anthem:DetailsView>
        </td>
        <td align="center">
            <anthem:Timer ID="Timer1" runat="server">
            </anthem:Timer>
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
            <asp:Timer ID="Timer2" runat="server" Interval="1000" ontick="Timer2_Tick" 
                Enabled="False">
            </asp:Timer>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <asp:Label ID="Label1" runat="server" Text="Timer" Font-Bold="True" 
                        Font-Size="Larger" ForeColor="#006600"></asp:Label>
                </ContentTemplate>
                <Triggers>
                <asp:AsyncPostBackTrigger ControlID="Timer2" EventName="Tick" />
            </Triggers>

            </asp:UpdatePanel>
        </td>
    </tr>
    <tr>
        <td align="center" colspan="2" style="height: 51px">
            <anthem:Label ID="LblUserAns" runat="server" Font-Bold="True" Font-Size="Large">Select 
            your answer:</anthem:Label>
            &nbsp;&nbsp;
            <anthem:DropDownList ID="DDLUserAns" runat="server" Height="34px" Width="144px">
                <asp:ListItem Value="1">Answer 1</asp:ListItem>
                <asp:ListItem Value="2">Answer 2</asp:ListItem>
                <asp:ListItem Value="3">Answer 3</asp:ListItem>
                <asp:ListItem Value="4">Answer 4</asp:ListItem>
            </anthem:DropDownList>
        </td>
    </tr>
    <tr>
        <td align="center" style="width: 750px">
            <anthem:Button ID="BtnNextQues" runat="server" onclick="BtnNextQues_Click" 
        Text="Next Ques" AutoUpdateAfterCallBack="True" />
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
    ConnectionString="<%$ ConnectionStrings:Quiz2ConnectionString3 %>" 
    SelectCommand="select top(5) * from
(
select * from dbo.Question WHERE ([QuizID] = @QuizID) 
)drs order by newid()">
                <SelectParameters>
                    <asp:SessionParameter DefaultValue="0" Name="QuizID" SessionField="QuizId" />
                </SelectParameters>
            </asp:SqlDataSource>
        </td>
        <td>
            &nbsp;</td>
    </tr>
</table>




</asp:Content>


