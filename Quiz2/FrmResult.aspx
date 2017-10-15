<%@ Page Language="C#" MasterPageFile="~/MasterPage3.master" AutoEventWireup="true" CodeFile="FrmResult.aspx.cs" Inherits="FrmResult" Title="Online Quiz" %>

<%@ Register assembly="Anthem" namespace="Anthem" tagprefix="anthem" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width: 100%">
        <tr>
            <td class="header_top">
                User Result</td>
        </tr>
    </table>
    <table style="width: 100%">
        <tr>
            <td>
                &nbsp;</td>
            <td>
                        <asp:Label ID="Label3" runat="server" 
                            Text="Your Score is" 
                            Font-Bold="True" Font-Size="Medium" ForeColor="Black"></asp:Label>
                        &nbsp;
                <asp:Label ID="Label1" runat="server" Text="----" Font-Bold="True" 
                    Font-Size="Medium"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
    ConnectionString="<%$ ConnectionStrings:Quiz2ConnectionString4 %>" 
    
                    SelectCommand="SELECT [QuestionID], [Title], [Answer1], [Answer2], [Answer3], [Answer4], [CorrectAnswer], [AnswerExplanation] FROM [Question]">
</asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:Quiz2ConnectionString4 %>" 
                    SelectCommand="SELECT [UserName], [QuizID], [Score], [DateTimeComplete] FROM [UserQuiz] WHERE ([UserName] = @UserName)">
                    <SelectParameters>
                        <asp:SessionParameter Name="UserName" SessionField="username" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:LoginView ID="LoginView1" runat="server">
                    <LoggedInTemplate>
                        <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Size="Medium" 
                            ForeColor="Black" Text="Previous Scores"></asp:Label>
                        <br />
                        <br />
                        <anthem:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                            DataSourceID="SqlDataSource2" UpdateAfterCallBack="True">
                            <Columns>
                                <asp:BoundField DataField="QuizID" HeaderText="QuizID" 
                                    SortExpression="QuizID" />
                                <asp:BoundField DataField="DateTimeComplete" HeaderText="DateTimeComplete" 
                                    SortExpression="DateTimeComplete" />
                                <asp:BoundField DataField="Score" HeaderText="Score" SortExpression="Score" />
                                <asp:BoundField DataField="UserName" HeaderText="UserName" 
                                    SortExpression="UserName" />
                            </Columns>
                        </anthem:GridView>
                    </LoggedInTemplate>
                    <AnonymousTemplate>
                        <asp:Label ID="Label2" runat="server" 
                            Text="You are not Logged In. Login from" 
                            Font-Bold="True" Font-Size="Medium" ForeColor="Black"></asp:Label>
                        &nbsp;
                        <asp:HyperLink ID="HyperLink1" runat="server" Font-Bold="True" 
                            Font-Size="X-Large" Font-Underline="True" ForeColor="#0033CC" 
                            NavigateUrl="~/FrmLogin.aspx">HomePage</asp:HyperLink>
                        &nbsp;
                        <asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Size="Medium" 
                            ForeColor="Black" Text="to see Result"></asp:Label>
                    </AnonymousTemplate>
                </asp:LoginView>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

