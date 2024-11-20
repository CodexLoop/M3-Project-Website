<%@ Page Title="Manage Account" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Manage.aspx.cs" Inherits="Townbush_Pharmacy_Website.Account.Manage" %>

<%@ Register Src="~/Account/OpenAuthProviders.ascx" TagPrefix="uc" TagName="OpenAuthProviders" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="HeadContent" runat="server">
    <!-- This CSS is only applied to this page -->
    <webopt:BundleReference runat="server" Path="~/Custom_CSS/formstyle.css" />
    
    <script>
        document.addEventListener('DOMContentLoaded', () => {

            /*================ SHOW MENU ================ */
            const navMenu = document.getElementById('nav-menu'),
                navClose = document.getElementById('nav-close'),
                navToggle = document.getElementById('nav-toggle')

            /*================ SHOW CONTENT ================ */
            /* Validate if constant exists */
            if (navToggle) {
                navToggle.addEventListener('click', () => { navMenu.classList.add('show-menu') })
            }

            /*================ HIDE CONTENT ================ */
            /* Validate if constant exists */
            if (navClose) {
                navClose.addEventListener('click', () => { navMenu.classList.remove('show-menu') })
            };

            /*================ REMOVE MENU MOBILE ================ */
            const navLink = document.querySelectorAll('.nav__link');

            const linkAction = () => {
                const navMenu = document.getElementById('nav-menu');
                // When we click on each link, we remove the show-menu class
                navMenu.classList.remove('show-menu');
            }
            navLink.forEach(n => n.addEventListener('click', linkAction));

            /*================ SHADOW HEADER ================ */
            const shadowHeader = () => {
                const header = document.getElementById('header');
                // When the scroll is greater then 50 view port height, add the shadow-header class to the header classlist.
                this.scrollY >= 50 ? header.classList.add('shadow-header')
                    : header.classList.remove('shadow-header');
            }
            window.addEventListener('scroll', shadowHeader);


            //// EMAIL JS
            //const contactForm = document.getElementById('main_form'),
            //    contactMessage = document.getElementById('contact-message')

            //const sendEmail = (e) => {
            //    e.preventDefault()

            //    // serviceID - templateID - #form - publickey
            //    emailjs.sendForm('service_qtf15fe', 'template_y1zjaxq', '#main_form', 'GafzmVXQhZZcUZ_Ut')
            //        .then(() => {
            //            // Show sent message
            //            contactMessage.textContent = 'Message sent successfully ✅'

            //            // Remove message after five seconds
            //            setTimeout(() => {
            //                contactMessage.textContent = ''
            //            }, 5000)

            //            // Clear input fields
            //            contactForm.reset()

            //        }, () => {
            //            // Show error Message
            //            contactMessage.textContent = 'Message not sent (service error) ❌'
            //        })
            //}
            //contactForm.addEventListener('submit', sendEmail)



            // SHOW SCROLL UP

            const scrollUp = () => {
                const scrollUp = document.getElementById('scroll-up');
                // When the scroll is higher than 350 viewport height, add the show-scroll class in the scroll-up class
                this.scrollY >= 350 ? scrollUp.classList.add('show-scroll')
                    : scrollUp.classList.remove('show-scroll');
            }
            window.addEventListener('scroll', scrollUp);


            // PAGE ACTIVE LINK

            function getActiveLink(e) {
                if (e.target.classList.contains('nav__link')) {
                    let activeLink = e.target.id;
                    sessionStorage.setItem('ActiveLinkID', activeLink);
                }
            }


            const listCollection = navMenu.getElementsByTagName('ul');
            const list = listCollection[0];

            list.addEventListener('click', (e) => { getActiveLink(e) });


            window.addEventListener('load', () => {
                if (sessionStorage.getItem('hiddenClass') == null) {
                    sessionStorage.setItem('hiddenClass', 'hide')
                }
                if (sessionStorage.getItem('hiddenClass') == 'hide') {
                    hidden.classList.add('hide')
                }
                else {
                    hidden.classList.remove('hide')
                }


                if (sessionStorage.getItem('PreviouslyActiveLinkID') == null) {
                    sessionStorage.setItem('ActiveLinkID', 'home_link');
                    sessionStorage.setItem('PreviouslyActiveLinkID', 'home_link');

                    currentNode = document.getElementById('home_link');
                    currentNode.classList.add('active-link');
                }

                else {
                    previousID = sessionStorage.getItem('PreviouslyActiveLinkID');
                    previousNode = document.getElementById(previousID);

                    previousNode.classList.remove('active-link');

                    currentID = sessionStorage.getItem('ActiveLinkID');
                    currentNode = document.getElementById(currentID);
                    currentNode.classList.add('active-link');

                    sessionStorage.setItem('PreviouslyActiveLinkID', currentID);
                }
            });

            /*================ SCROLL REVEAL ANIMATION ================ */
            const sr = ScrollReveal({
                origin: 'top',
                distance: '60px',
                duration: 2000,
                delay: 300,
                // reset: true // Animations repeat
            })

            sr.reveal(`.home__name, .home__info,
		   .about__container .section__title-1, .about__info,
		   .contact__social, .contact__data,
           .section-title, .new__mens,
           .newsletter__container, .section__title-1,
           .section__title-2`,
                { origin: 'left' })
            sr.reveal(`.about__image, .contact__mail,
           .offer__container`, { origin: 'right' })

            sr.reveal(`.services__card, .projects__card,
           .sneaker, .collection__card`, { interval: 100 })

            sr.reveal(`.new__sneaker-card`, { origin: 'right', interval: 100 })



            const select = document.querySelectorAll('select')
            select.forEach(n => n.addEventListener('change', event => event.preventDefault()));
            const hidden = document.getElementById('hidden')

            function deliveryDetails() {
                let option = document.querySelectorAll('option')

                if (!option[2].selected) {
                    sessionStorage.setItem('hiddenClass', 'hide')
                }
                else {
                    sessionStorage.setItem('hiddenClass', 'show')
                }
            }

            select[0].addEventListener('change', (e) => { deliveryDetails(e) })
        })
    </script>
</asp:Content>



<asp:Content ContentPlaceHolderID="MainContent" runat="server">
    <main aria-labelledby="title">
        <div class="container">
            <br>
            <br>
            <br>
            <br>
            <br>
            <br>
<br>
         
            <asp:Label ID="Message" runat="server" Text="Label"></asp:Label>
            <asp:Panel ID="CustomerDetailsPanel" runat="server" Visible="false">
                <h4>Customer Details</h4>
                <p>Customer ID:
                    <asp:Label ID="LabelID" runat="server" /></p>
                <p>First Name:
                    <asp:Label ID="CustomerNameLabel" runat="server" /></p>
                <p>Last Name:
                    <asp:Label ID="lastCustomerName" runat="server" /></p>
                <p>Address:
                    <asp:Label ID="Addresslabel" runat="server" /></p>
                <p>Contact Number:
                    <asp:Label ID="ContactNumberLabel" runat="server" /></p>
                <p>Email Address:
                    <asp:Label ID="EmailAddressLabel" runat="server" /></p>
                <!-- Allow employee to update their details -->
                <br>
                <br>

                <asp:CheckBox ID="CheckBox1" Text="Update Details?" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox1_CheckedChanged" />
                <asp:Panel ID="UpdateEmployeeDetails" runat="server" Visible="false">
                    <div class="input-group">
                        <asp:Label ID="LabelName" runat="server" Text="First Name:"></asp:Label>
                        <asp:TextBox ID="NameTextBox" runat="server" BorderStyle="Solid" Width="50%" Height="30px"></asp:TextBox>
                    </div>
                    <div class="input-group">
                        <asp:Label ID="LabelLastName" runat="server" Text="Last Name:"></asp:Label>
                        <asp:TextBox ID="lastNameTextBox" runat="server" BorderStyle="Solid" Width="50%" Height="30px"></asp:TextBox>
                    </div>

                    <div class="input-group">
                        <asp:Label ID="LabelAddress" runat="server" Text="Address:"></asp:Label>
                        <asp:TextBox ID="AddressTextbox" runat="server" BorderStyle="Solid" Width="50%" Height="30px"></asp:TextBox>
                    </div>
                    <div class="input-group">
                        <asp:Label ID="ContactNo" runat="server" Text="Contact Number:"></asp:Label>
                        <asp:TextBox ID="ContactTextBox" runat="server" BorderStyle="Solid" Width="50%" Height="30px"></asp:TextBox>
                    </div>
                    <div class="input-group">
                        <asp:Label ID="Email" runat="server" Text="Email Address:"></asp:Label>
                        <asp:TextBox ID="EmailTextbox" runat="server" BorderStyle="Solid" Width="50%" Height="30px"></asp:TextBox>
                    </div>
                    <asp:Button ID="UpdateCustomerButton" runat="server" Text="Update Details" OnClick="UpdateCustomerButton_Click" />
                    &nbsp;&nbsp;
                                    <br />
                    <br />
                </asp:Panel>
            </asp:Panel>

            <h2 id="title"><%: Title %>.</h2>

            <div class="row">
                <div class="col-md-12">
                    <h4>Orders</h4>
                    <p>
                        <asp:HyperLink ID="order_Link" NavigateUrl="/Account/Orders" Text="View Orders" runat="server" /></p>
                    <br>
                    <br>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <h4>Prescriptions</h4>
                    <p>
                        <asp:HyperLink ID="Prescribtion_Link" NavigateUrl="/Account/Prescriptions" Text="Upload Prescriptions" runat="server" /></p>
                    <br>
                    <br>
                </div>
            </div>
            <br>
            <br>
            <div>
                <asp:PlaceHolder runat="server" ID="successMessage" Visible="false" ViewStateMode="Disabled">
                    <p class="text-success"><%: SuccessMessage %></p>
                </asp:PlaceHolder>
            </div>

            <%--<div class="col-md-12">
            <div class="row">
                <br><br><br><br><br><br>
                <h4>Change your account settings</h4>
                <hr />
                <dl class="dl-horizontal">
                    <dt>Password:</dt>
                    <dd>
                        <asp:HyperLink NavigateUrl="/Account/ManagePassword" Text="[Change]" Visible="false" ID="ChangePassword" runat="server" />
                        <asp:HyperLink NavigateUrl="/Account/ManagePassword" Text="[Create]" Visible="false" ID="CreatePassword" runat="server" />
                    </dd>
                    <dt>External Logins:</dt>
                    <dd><%: LoginsCount %>
                        <asp:HyperLink NavigateUrl="/Account/ManageLogins" Text="[Manage]" runat="server" />

                    </dd>--%>
            <%--
                        Phone Numbers can used as a second factor of verification in a two-factor authentication system.
                        See <a href="https://go.microsoft.com/fwlink/?LinkId=403804">this article</a>
                        for details on setting up this ASP.NET application to support two-factor authentication using SMS.
                        Uncomment the following blocks after you have set up two-factor authentication
            --%>
            <%--
                    <dt>Phone Number:</dt>
                    <% if (HasPhoneNumber)
                        { %>
                    <dd>
                        <asp:HyperLink NavigateUrl="/Account/AddPhoneNumber" runat="server" Text="[Add]" />
                    </dd>
                    <% }
                        else
                        { %>
                    <dd>
                        <asp:Label Text="" ID="PhoneNumber" runat="server" />
                        <asp:HyperLink NavigateUrl="/Account/AddPhoneNumber" runat="server" Text="[Change]" /> &nbsp;|&nbsp;
                        <asp:LinkButton Text="[Remove]" OnClick="RemovePhone_Click" runat="server" />
                    </dd>
                    <% } %>
            --%>

            <%--                    <dt>Two-Factor Authentication:</dt>
                    <dd>
                        <p>
                            There are no two-factor authentication providers configured. See <a href="https://go.microsoft.com/fwlink/?LinkId=403804">this article</a>
                            for details on setting up this ASP.NET application to support two-factor authentication.
                        </p>
                        <% if (TwoFactorEnabled)
                            { %> --%>
            <%--
                        Enabled
                        <asp:LinkButton Text="[Disable]" runat="server" CommandArgument="false" OnClick="TwoFactorDisable_Click" />
            --%>
            <%--<% }
                            else
                            { %> 
                        <%----%>
            <%--Disabled
                        <asp:LinkButton Text="[Enable]" CommandArgument="true" OnClick="TwoFactorEnable_Click" runat="server" />
            --%>
            <%-- } 
                    </dd>
                </dl>
            </div>
        </div>--%>
        </div>
    </main>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
</asp:Content>
