<%@ Page Title="Townbush | Contact Us" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="Townbush_Pharmacy_Website.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main aria-labelledby="title">

        <!--================ CONTACT ================-->
        <section class="contact section" id="contact">
            <div class="contact__container grid">
                <div class="contact__data">
                    <h2 class="section__title-2">
                        <span>Contact Us.</span>
                    </h2>

                    <p class="contact__description-1">
                        We will attend to all emails. Send us any
                        message you want and we'll get back to you
                        asap.
                    </p>

                    <p class="contact__description-2">
                        We need your <b>Name</b> and <b>Email Address</b>, but
                        you won't receive anything other than your reply.
                    </p>

                    <div class="geometric-box"></div>
                </div>

                <div class="contact__mail">
                    <h2 class="contact__title">
                        Send Us A Message
                    </h2>

                    <div class="contact__form" id="contact-form">
                        <div class="contact__group">
                            <div class="contact__box">
                                <input type="text" name="user_name" class="contact__input" id="name" required placeholder="First Name">
                                <label for="name" class="contact__label">First Name</label>
                            </div>

                            <div class="contact__box">
                                <input type="email" name="user_email" class="contact__input" id="email" required placeholder="Email Address">
                                <label for="email" class="contact__label">Email Address</label>
                            </div>
                        </div>

                        <div class="contact__box">
                            <input type="text" name="user_subject" class="contact__input" id="subject" required placeholder="Subject">
                            <label for="subject" class="contact__label">Subject</label>
                        </div>

                        <div class="contact__box contact__area">
                            <textarea name="user_message" id="message" class="contact__input" required placeholder="Message" ></textarea>
                            <label for="message" class="contact__label">Message</label>
                        </div>

                        <p class="contact__message" id="contact-message"></p>

                        <button type="submit" class="contact__button button">
                            <img src="Resources/send-plane-solid-outline-1.png" alt="icon not supported by browser" height="16px" width="16px"> Send Message
                        </button>

                    </div>
                </div>
                <div class="contact__social">
                    <img src="Resources/line-graphics-1.png" alt="graphic not supported by browser" class="contact__social-arrow">
                        
                    <div class="contact__social-data">
                        <div>
                            <p class="contact__social-description-1">
                                Does not send emails
                            </p>

                            <p class="contact__social-description-1">
                                Write us on our social networks
                            </p>
                        </div>

                        <div class="contact__social-links">
                            <a href="https://www.facebook.com/" target="_blank" class="contact__social-link">
                                <i class='bx bxl-facebook-circle'></i>
                            </a>

                            <a href="https://www.instagram.com/" target="_blank" class="contact__social-link">
                                <i class='bx bxl-instagram'></i>
                            </a>

                            <a href="https://www.linkedin.com/" target="_blank" class="contact__social-link">
                                <i class='bx bxl-linkedin'></i>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </main>
</asp:Content>

