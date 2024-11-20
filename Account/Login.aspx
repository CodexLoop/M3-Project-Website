<%@ Page Title="Log in" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Townbush_Pharmacy_Website.Account.Login" Async="true" %>

<%@ Register Src="~/Account/OpenAuthProviders.ascx" TagPrefix="uc" TagName="OpenAuthProviders" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="HeadContent" runat="server">
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

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <main aria-labelledby="title">
        <div class="container">
            <br>
            <br>
            <br>
            <br>
            <br>
            <br>

            <h2 id="title"><%: Title %>.</h2>
            <div class="col-md-8">
                <section id="loginForm">
                    <div class="row">
                        <h4>Use a local account to log in.</h4>
                        <hr />
                        <asp:PlaceHolder runat="server" ID="ErrorMessage" Visible="false">
                            <p class="text-danger">
                                <asp:Literal runat="server" ID="FailureText" />
                            </p>
                        </asp:PlaceHolder>
                        <div class="row">
                            <asp:Label runat="server" AssociatedControlID="Email" CssClass="col-md-2 col-form-label">Email</asp:Label>
                            <div class="col-md-10">
                                <asp:TextBox runat="server" ID="Email" CssClass="form-control" TextMode="Email" />
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="Email"
                                    CssClass="text-danger" ErrorMessage="The email field is required." />
                            </div>
                        </div>
                        <div class="row">
                            <asp:Label runat="server" AssociatedControlID="Password" CssClass="col-md-2 col-form-label">Password</asp:Label>
                            <div class="col-md-10">
                                <asp:TextBox runat="server" ID="Password" TextMode="Password" CssClass="form-control" />
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="Password" CssClass="text-danger" ErrorMessage="The password field is required." />
                            </div>
                        </div>
                        <div class="row">
                            <div class="offset-md-2 col-md-10">
                                <div class="checkbox">
                                    <asp:CheckBox runat="server" ID="RememberMe" />
                                    <asp:Label runat="server" AssociatedControlID="RememberMe">Remember me?</asp:Label>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-offset-md-2 col-md-10">
                                <asp:Button runat="server" OnClick="LogIn" Text="Log in" CssClass="btn btn-outline-dark" />
                            </div>
                        </div>
                    </div>
                    <br />
                    <p>
                        <asp:HyperLink runat="server" ID="RegisterHyperLink" ViewStateMode="Disabled">Register as a new user</asp:HyperLink>
                    </p>
                    <p>
                        <%-- Enable this once you have account confirmation enabled for password reset functionality
                    <asp:HyperLink runat="server" ID="ForgotPasswordHyperLink" ViewStateMode="Disabled">Forgot your password?</asp:HyperLink>
                        --%>
                    </p>
                </section>
            </div>

            <div class="col-md-4">
                <section id="socialLoginForm">
                    <uc:OpenAuthProviders runat="server" ID="OpenAuthLogin" />
                </section>
            </div>

        </div>
    </main>
    <br />
    <br />
    <br />


</asp:Content>
