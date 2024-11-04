<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="Townbush_Pharmacy_Website.Products" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div id="shop-cover">
        <!--===== HOME =====-->
        <section class="home" id="home">
            <div class="shopping__container bd-grid">
                <div class="home__sneaker">
                    <div class="home__shape"></div>
                    <img src="Resources/24.png" alt="" class="home__img">
                </div>

                <div class="home__data">
                    <span class="home__new" style="color: darkred;">New in</span>
                    <h1 class="home__title">MUCOLYTIC RELIEF
                    <br>
                        ACC600 EFFERVERSCENT</h1>
                    <p class="shopping__description">Relieve mucus and find peace again!</p>
                    <a href="#new_product" class="shopping__button">Buy now</a>
                </div>
            </div>
        </section>

        <!--===== ALL PRODUCTS =====-->
        <section class="featured section" id="shop">
            <h2 id="shop-title" class="section-title">All Products</h2>

            <div class="featured__container bd-grid">
                <article class="sneaker">
                    <img src="Resources/2.png" alt="" class="sneaker__img">
                    <span class="sneaker__name">Aspirin</span>
                    <span class="sneaker__price">$109.99</span>
                    <a data-prod-id="1" href="" class="button-light">Add to Cart <i class='bx bx-right-arrow-alt button-icon'></i></a>
                </article>

                <article class="sneaker">
                    <img src="Resources/3.png" alt="" class="sneaker__img">
                    <span class="sneaker__name">Nurofen</span>
                    <span class="sneaker__price">$109.99</span>
                    <a data-prod-id="2" href="" class="button-light">Add to Cart <i class='bx bx-right-arrow-alt button-icon'></i></a>
                </article>

                <article class="sneaker">
                    <img src="Resources/4.png" alt="" class="sneaker__img">
                    <span class="sneaker__name">Panado Pills</span>
                    <span class="sneaker__price">$109.99</span>
                    <a data-prod-id="3" href="" class="button-light">Add to Cart <i class='bx bx-right-arrow-alt button-icon'></i></a>
                </article>

                <article class="sneaker">
                    <img src="Resources/5.png" alt="" class="sneaker__img">
                    <span class="sneaker__name">Panado Syrup</span>
                    <span class="sneaker__price">$79.99</span>
                    <a data-prod-id="4" href="" class="button-light">Add to Cart <i class='bx bx-right-arrow-alt button-icon'></i></a>
                </article>

                <article class="sneaker">
                    <img src="Resources/8.png" alt="" class="sneaker__img">
                    <span class="sneaker__name">Benylin</span>
                    <span class="sneaker__price">$79.99</span>
                    <a data-prod-id="5" href="" class="button-light">Add to Cart <i class='bx bx-right-arrow-alt button-icon'></i></a>
                </article>

                <article class="sneaker">
                    <img src="Resources/10.png" alt="" class="sneaker__img">
                    <span class="sneaker__name">Allergex (30)</span>
                    <span class="sneaker__price">$79.99</span>
                    <a data-prod-id="6" href="" class="button-light">Add to Cart <i class='bx bx-right-arrow-alt button-icon'></i></a>
                </article>

                <article class="sneaker">
                    <img src="Resources/9.png" alt="" class="sneaker__img">
                    <span class="sneaker__name">Allergex</span>
                    <span class="sneaker__price">$79.99</span>
                    <a data-prod-id="7" href="" class="button-light">Add to Cart <i class='bx bx-right-arrow-alt button-icon'></i></a>
                </article>

                <article class="sneaker">
                    <img src="Resources/11.png" alt="" class="sneaker__img">
                    <span class="sneaker__name">Berocca</span>
                    <span class="sneaker__price">$79.99</span>
                    <a data-prod-id="8" href="" class="button-light">Add to Cart <i class='bx bx-right-arrow-alt button-icon'></i></a>
                </article>

                <article class="sneaker">
                    <img src="Resources/12.png" alt="" class="sneaker__img">
                    <span class="sneaker__name">Zinplex Junior</span>
                    <span class="sneaker__price">$129.99</span>
                    <a data-prod-id="9" href="" class="button-light">Add to Cart <i class='bx bx-right-arrow-alt button-icon'></i></a>
                </article>

                <article class="sneaker">
                    <img src="Resources/15.png" alt="" class="sneaker__img">
                    <span class="sneaker__name">Rennie Orange</span>
                    <span class="sneaker__price">$129.99</span>
                    <a data-prod-id="10" href="" class="button-light">Add to Cart <i class='bx bx-right-arrow-alt button-icon'></i></a>
                </article>

                <article class="sneaker">
                    <img src="Resources/17.png" alt="" class="sneaker__img">
                    <span class="sneaker__name">Rennie Peppermint</span>
                    <span class="sneaker__price">$129.99</span>
                    <a data-prod-id="11" href="" class="button-light">Add to Cart <i class='bx bx-right-arrow-alt button-icon'></i></a>
                </article>

                <article class="sneaker">
                    <img src="Resources/18.png" alt="" class="sneaker__img">
                    <span class="sneaker__name">Echinaforce Junior</span>
                    <span class="sneaker__price">$129.99</span>
                    <a data-prod-id="12" href="" class="button-light">Add to Cart <i class='bx bx-right-arrow-alt button-icon'></i></a>
                </article>

                <article class="sneaker">
                    <img src="Resources/21.png" alt="" class="sneaker__img">
                    <span class="sneaker__name">Echinaforce Drops</span>
                    <span class="sneaker__price">$129.99</span>
                    <a data-prod-id="13" href="" class="button-light">Add to Cart <i class='bx bx-right-arrow-alt button-icon'></i></a>
                </article>

                <article class="sneaker">
                    <img src="Resources/23.png" alt="" class="sneaker__img">
                    <span class="sneaker__name">ACC200</span>
                    <span class="sneaker__price">$129.99</span>
                    <a data-prod-id="14" href="" class="button-light">Add to Cart <i class='bx bx-right-arrow-alt button-icon'></i></a>
                </article>

                <article id="new_product" class="sneaker">
                    <img src="Resources/24.png" alt="" class="sneaker__img">
                    <span class="sneaker__name">ACC600</span>
                    <span class="sneaker__price">$129.99</span>
                    <a data-prod-id="15" href="" class="button-light">Add to Cart <i class='bx bx-right-arrow-alt button-icon'></i></a>
                </article>
            </div>

            <div class="sneaker__pages bd-grid">
                <div>
                    <span class="sneaker__pag">1</span>
                    <span class="sneaker__pag">2</span>
                    <span class="sneaker__pag">3</span>
                    <span class="sneaker__pag">4</span>
                    <span class="sneaker__pag">&#8594;</span>
                </div>
            </div>
        </section>
    </div>

    <div style="display:flex; justify-content:center;">
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:G2Pmb2024ConnectionString  %>" SelectCommand="SELECT * FROM [Product] WHERE ([isPrescriptionMed] = @isPrescriptionMed)">
            <SelectParameters>
                <asp:Parameter DefaultValue="FALSE" Name="isPrescriptionMed" Type="Boolean" />
            </SelectParameters>
        </asp:SqlDataSource>

        <div id="prod_list">
            <h1 style="text-align: center;">Products list</h1>

            <br />

            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnRowDataBound="GridView1_RowDataBound" CellPadding="5" BorderStyle="Solid" BorderWidth="4px" BorderColor="#333333" AlternatingRowStyle-BackColor="WhiteSmoke" EditRowStyle-BorderStyle="Solid" EditRowStyle-BorderColor="#333333" Font-Italic="True" GridLines="Vertical" HeaderStyle-BackColor="WhiteSmoke" HeaderStyle-BorderWidth="4" DataKeyNames="ProdID" OnRowCommand="GridView1_RowCommand" DataSourceID="SqlDataSource1" Width="799px">
                <AlternatingRowStyle BackColor="WhiteSmoke"></AlternatingRowStyle>
                <Columns>
                    <asp:BoundField DataField="ProdID" HeaderText="ProdID" InsertVisible="False" ReadOnly="True" SortExpression="ProdID" />
                    <asp:BoundField DataField="ProdName" HeaderText="ProdName" SortExpression="ProdName" />
                    <asp:BoundField DataField="ProdDescription" HeaderText="ProdDescription" SortExpression="ProdDescription" />
                    <asp:BoundField DataField="ProdPrice" HeaderText="ProdPrice" SortExpression="ProdPrice" />
                    <asp:BoundField DataField="QtyInStock" HeaderText="QtyInStock" SortExpression="QtyInStock" Visible="False" />
                    <asp:ImageField DataImageUrlField="ProdID" DataImageUrlFormatString="~/Pictures/{0}.jpg" ControlStyle-Width="150px">
                        <ControlStyle Width="150px"></ControlStyle>
                    </asp:ImageField>
                    <asp:TemplateField HeaderText="Add To Cart">
                        <ItemTemplate>
                            <asp:Button ID="Button1" runat="server" Text="Add to Cart" CommandName="BtnClick" CommandArgument='<%# Eval("ProdID") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>

                <EditRowStyle BorderColor="#333333" BorderStyle="Solid"></EditRowStyle>

                <HeaderStyle BackColor="WhiteSmoke" BorderWidth="4px"></HeaderStyle>
            </asp:GridView>
        </div>
    </div>
</asp:Content>
