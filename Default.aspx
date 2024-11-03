<%@ Page Title="Townbush | Home" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Townbush_Pharmacy_Website._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
 
    <main id="homepage" >
       <section id="hero_section">
           <div class="container">
              
               <h1 class="home__name">
                    Townbush Pharmacy.
                </h1>
                
               <div class="home__info">
                    <p class="home__description">
                        Welcome! Now offering dietary and health insights. We offer the best advice. Click <a href="~/Insights" runat="server"><b>Health Insights</b></a> to check it out!
                    </p>

                    <a href="#services"  class="home__scroll">
                        <div class="home__scroll-box">
                            <img src="Resources/arrow-down-1.png" alt="graphic not supported by browser" height="10" width="10">
                        </div>
                        <span class="home__scroll-text">Scroll down</span>
                    </a>
                </div>

           </div>

            <video autoplay muted loop>
                <source src="Resources/197486-905015022_tiny.mp4" type="video/mp4">
                Your browser does not support the video tag.
            </video>

        </section>

        <!-- Services -->
       <section class="services section" id="services">
                <h2 class="section__title-2">
                    <span>Services.</span>
                </h2>

                <div class="services__container container grid">
                    <article class="services__card">
                        <div class="services__border"></div>

                        <div class="services__content">
                            <div class="services__icon">
                                <div class="service__box"></div>
                                <img src="Resources/talking.png" alt="icon not supported by browser">
                            </div>

                            <h2 class="service__title">Medication Counselling</h2>

                            <p class="service__description">
                                Regardless of what medical information you 
                                require, we got you!  Ask our pharmacist 
                                about your medications.
                            </p>
                        </div>
                    </article>

                    <article class="services__card">
                        <div class="services__border"></div>

                        <div class="services__content">
                            <div class="services__icon">
                                <div class="service__box"></div>
                                <img src="Resources/fast-delivery.png" alt="icon not supported by browser">
                            </div>

                            <h2 class="service__title">Home Delivery</h2>

                            <p class="service__description">
                                Sick? Need medication? 
                                No need to ever leave the house when you
                                sick. Get quick, safe and immediate deliveries
                                straight to your doorstep.
                            </p>
                        </div>
                    </article>

                    <article class="services__card">
                        <div class="services__border"></div>

                        <div class="services__content">
                            <div class="services__icon">
                                <div class="service__box"></div>
                                <img src="Resources/vaccine.png" alt="icon not supported by browser">
                            </div>

                            <h2 class="service__title">Vaccinations & Immunizations</h2>

                            <p class="service__description">
                                Schedule appointments for vaccines.
                                No need to wait in long lines.
                            </p>
                        </div>
                    </article>

                      <article class="services__card">
      <div class="services__border"></div>

      <div class="services__content">
          <div class="services__icon">
              <div class="service__box"></div>
              <img src="Resources/vaccine.png" alt="icon not supported by browser">
          </div>

          <h2 class="service__title">Vaccinations & Immunizations</h2>

          <p class="service__description">
              Schedule appointments for vaccines.
              No need to wait in long lines.
          </p>
      </div>
  </article>

                    <article class="services__card">
    <div class="services__border"></div>

    <div class="services__content">
        <div class="services__icon">
            <div class="service__box"></div>
            <img src="Resources/talking.png" alt="icon not supported by browser">
        </div>

        <h2 class="service__title">Medication Counselling</h2>

        <p class="service__description">
            Regardless of what medical information you 
            require, we got you!  Ask our pharmacist 
            about your medications.
        </p>
    </div>
</article>

<article class="services__card">
    <div class="services__border"></div>

    <div class="services__content">
        <div class="services__icon">
            <div class="service__box"></div>
            <img src="Resources/fast-delivery.png" alt="icon not supported by browser">
        </div>

        <h2 class="service__title">Home Delivery</h2>

        <p class="service__description">
            Sick? Need medication? 
            No need to ever leave the house when you
            sick. Get quick, safe and immediate deliveries
            straight to your doorstep.
        </p>
    </div>
</article>
                </div>
             </section>
    </main>
         <br /><br /><br />     <br /><br /><br />     <br /><br /><br />

</asp:Content>
