<%@ Page Title="Townbush | About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="Townbush_Pharmacy_Website.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main aria-labelledby="title">
        
         <!--================ ABOUT ================-->
            <section class="about section" id="about">
                <div class="about__container container grid">
                    <h2 class="section__title-1">
                        <span>About Us.</span>
                    </h2>

                    <div class="about__perfil">
                        <div class="about__image">
                            <img src="Resources/african_doctor.jpg" alt="image not supported by browser" class="about__img">
                        </div>

                        <div class="about__shadow"></div>

                        <div class="geometric-box"></div>
                        <img src="Resources/line-graphics-2.png" alt="graphic not supported by browser" class="about__line">
                        <div class="about__box"></div>
                    </div>

                    <div class="about__info">
                        <p class="about__description">
                            At <b>Townbush Pharmacy</b>, we are dedicated to providing personalized
                            and professional <b>healthcare services</b>. Our team is committed to delivering 
                            quality care, offering a wide range of prescription medications, health 
                            products, and expert advice to support your well-being. Trust us to be 
                            your reliable partner in maintaining and improving your health.
                        </p>

                        <ul class="about__list">
                            <li class="about__item">
                                <b>Our skills are:</b> Health care, Diet Plans, and Nutrition.
                            </li>
                        </ul>

                        <div class="about__buttons">
                            <a href="~/Contact" runat="server" class="button">
                                <img src="Resources/send-plane-solid-outline-1.png" alt="icon not supported by browser" height="12px" width="12px"> Contact Us
                            </a>

                            <a href="https://www.linkedin.com" target="_blank" class="button__ghost">
                                <img src="Resources/linkedin.png" alt="icon not supported by browser" height="12px" width="12px">
                            </a>

                        </div>
                    </div>
                </div>

            </section>

    </main>

             <br /><br /><br />     <br /><br /><br />     <br /><br /><br />
             <br /><br /><br />     <br /><br /><br />     <br /><br /><br />

</asp:Content>
