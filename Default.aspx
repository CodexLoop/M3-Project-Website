<%@ Page Title="Townbush | Home" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Townbush_Pharmacy_Website._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
     <main id="homepage">

            <!--===== HERO SECTION =====-->
            <section id="hero_section">
                <div class="container">
                    <h1 class="home__name">
                        Townbush Pharmacy.
                    </h1>

                    <div class="home__info">
                        <p class="home__description">
                            Welcome! Now offering dietary and health insights. We offer the best advice. Click <a
                                href="~/Insights" runat="server"><b>Health Insights</b></a> to check it out!
                        </p>

                        <a href="#featured" class="home__scroll">
                            <div class="home__scroll-box">
                                <img src="Resources/arrow-down-1.png" alt="graphic not supported by browser" height="10"
                                    width="10">
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


            <!--===== SALE PROMOTION =====-->
            <section class="featured section" id="featured">
                <h2 class="section-title">SALE PROMO!</h2>

                <div class="featured__container bd-grid">
                    <article class="sneaker">
                        <div class="sneaker__sale">Sale</div>
                        <img src="Resources/5.png" alt="" class="sneaker__img">
                        <span class="sneaker__name">Panado Syrup</span>
                        <span class="sneaker__price">$10.99 <br> <del>$12.99</del></span>
                        <a href="" class="button-light">Add to Cart <i class='bx bx-right-arrow-alt button-icon'></i></a>
                    </article>

                    <article class="sneaker">
                        <div class="sneaker__sale">Sale</div>
                        <img src="Resources/10.png" alt="" class="sneaker__img">
                        <span class="sneaker__name">Allergex Syrup</span>
                        <span class="sneaker__price">$29.99 <br> <del>$40.00</del></span>
                        <a href="" class="button-light">Add to Cart <i
                                class='bx bx-right-arrow-alt button-icon'></i></a>
                    </article>

                    <article class="sneaker">
                        <div class="sneaker__sale">Sale</div>
                        <img src="Resources/12.png" alt="" class="sneaker__img">
                        <span class="sneaker__name">Zinplex Junior Syrup</span>
                        <span class="sneaker__price">$49.99 <br> <del>$79.99</del></span>
                        <a href="" class="button-light">Add to Cart <i
                                class='bx bx-right-arrow-alt button-icon'></i></a>
                    </article>
                </div>
            </section>


            <!--===== COLLECTION =====-->
            <section class="collection section">
                <div class="collection__container bd-grid">
                    <div class="collection__card">
                        <div class="collection__data">
                            <h3 class="collection__name">OTC Medication</h3>
                            <p class="collection__description"><b>New restock 2024</b></p>
                            <a href="#" class="button-light">Buy now <i
                                    class='bx bx-right-arrow-alt button-icon'></i></a>
                        </div>

                        <img src="Resources/hand.png" style="top:-1rem; right:-1rem;" alt="" class="collection__img">
                    </div>

                    <div class="collection__card">
                        <div class="collection__data">
                            <h3 class="collection__name">Prescriptions</h3>
                            <p class="collection__description"><b>Refills & renewals 2024</b></p>
                            <a href="#" class="button-light">Go now <i
                                    class='bx bx-right-arrow-alt button-icon'></i></a>
                        </div>

                        <img src="Resources/01.png" style="transform:rotate(-100deg); top:5rem;" alt=""
                            class="collection__img">
                    </div>
                </div>
            </section>


            <!--===== WOMEN HEALTH =====-->
            <section class="women section" id="women">
                <h2 class="section-title">Womens Health</h2>

                <div class="women__container bd-grid">
                    <article class="sneaker">
                        <img src="Resources/18.png" alt="" class="sneaker__img">
                        <span class="sneaker__name">Echinaforce Junior</span>
                        <span class="sneaker__price">$29.99</span>
                        <a href="" class="button-light">Add to Cart <i
                                class='bx bx-right-arrow-alt button-icon'></i></a>
                    </article>

                    <article class="sneaker">
                        <img src="Resources/21.png" alt="" class="sneaker__img">
                        <span class="sneaker__name">Echinaforce 100ml</span>
                        <span class="sneaker__price">$49.99</span>
                        <a href="" class="button-light">Add to Cart <i
                                class='bx bx-right-arrow-alt button-icon'></i></a>
                    </article>

                    <article class="sneaker">
                        <img src="Resources/8.png" alt="" class="sneaker__img">
                        <span class="sneaker__name">Benylin 200ml</span>
                        <span class="sneaker__price">$99.99</span>
                        <a href="" class="button-light">Add to Cart <i
                                class='bx bx-right-arrow-alt button-icon'></i></a>
                    </article>

                    <article class="sneaker">
                        <img src="Resources/4.png" alt="" class="sneaker__img">
                        <span class="sneaker__name">Panado 50 tablets</span>
                        <span class="sneaker__price">$129.99</span>
                        <a href="" class="button-light">Add to Cart <i
                                class='bx bx-right-arrow-alt button-icon'></i></a>
                    </article>
                </div>
            </section>

            <!--===== OFFER =====-->
            <section class="offer section">
                <div class="offer__container bd-grid">
                    <div class="offer__data">
                        <h3 class="offer__title">50% OFF</h3>
                        <p class="offer__description">In Vitamins and Supplements</p>
                        <a href="#" class="shopping__button">Buy Now</a>
                    </div>

                    <img src="Resources/03.png" alt="" class="offer__img">
                </div>
            </section>

            <!--===== MENS HEALTH =====-->
            <section class="new section" id="new">
                <h2 class="section-title">MENS HEALTH</h2>

                <div class="new__container bd-grid">
                    <div class="new__mens">
                        <img src="Resources/men.png" alt="" class="new__mens-img">
                        <h3 class="new__title">Staying healthy</h3>
                        <span class="new__price"><b>Only $49.99</b></span>
                        <a href="#" class="button-light">View Full Catalogue <i
                                class='bx bx-right-arrow-alt button-icon'></i></a>
                    </div>

                    <div class="new__sneaker">
                        <div class="new__sneaker-card">
                            <img src="Resources/23.png" alt="" class="new__sneaker-img">
                            <div class="new__sneaker-overlay">
                                <a href="#" class="shopping__button">Add to Cart</a>
                            </div>
                        </div>

                        <div class="new__sneaker-card">
                            <img src="Resources/17.png" alt="" class="new__sneaker-img">
                            <div class="new__sneaker-overlay">
                                <a href="#" class="shopping__button">Add to Cart</a>
                            </div>
                        </div>

                        <div class="new__sneaker-card">
                            <img src="Resources/15.png" alt="" class="new__sneaker-img">
                            <div class="new__sneaker-overlay">
                                <a href="#" class="shopping__button">Add to Cart</a>
                            </div>
                        </div>

                        <div class="new__sneaker-card">
                            <img src="Resources/11.png" alt="" class="new__sneaker-img">
                            <div class="new__sneaker-overlay">
                                <a href="#" class="shopping__button">Add to Cart</a>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            <!--===== NEWSLETTER =====-->
            <section id="newsletter" class="newsletter section">
                <div class="newsletter__container bd-grid">
                    <div>
                        <h3 class="newsletter__title">Subscribe Our Newsletter And Get <br> 10% OFF</h3>
                        <p class="newsletter__description">Get 10% discount for all products</p>
                    </div>

                    <div class="newsletter__subscribe">
                        <input type="text" placeholder="@email.com" class="newsletter__input">
                        <a href="#" class="shopping__button">Subscribe</a>
                    </div>
                </div>
            </section>


            <!--===== SERVICES =====-->
            <section class="services section" id="services">
                <h2 class="section__title-2">
                    <span>Other Services.</span>
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
                            <br />
                            <p class="service__description">
                                Regardless of what medical information you
                                require, we got you! Ask our pharmacist
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
                            <br />
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
                            <br />
                            <p class="service__description">
                                Schedule appointments for vaccines.
                                No need to wait in long lines.
                            </p>
                        </div>
                    </article>
                </div>
            </section>


            <!-- DID YOU KNOW? -->
            <section class="projects section" id="projects">
                <h2 class="section__title-1">
                    <span>Did you know?</span>
                </h2>

                <div class="projects__container container grid">
                    <article class="projects__card">
                        <div class="projects__image">
                            <img src="Resources/Blood sugar.jpg" alt="image not supported by browser"
                                class="projects__img">

                            <a title="Read more"
                                href="https://www.express-scripts.com/pharmacy/blog/dangers-of-low-blood-sugar"
                                target="_blank" class="projects__button button">
                                <img src="Resources/rightup-black.png" alt="graphic not supported by browser">
                            </a>
                        </div>

                        <div class="projects__content">
                            <h3 class="projects__subtitle"><b>By EVERNORTH</b></h3>
                            <h2 class="project__title">Dangers of Low Blood Sugar</h2>
                            <br />
                            <p class="projects__description">
                                Your blood sugar fluctuates throughout the
                                day, going up or down depending on the food
                                you eat...
                            </p>

                            <div class="projects__buttons">
                                <a href="https://www.linkedin.com/" target="_blank" class="projects__link">
                                    <i class='bx bxl-linkedin'></i>View
                                </a>

                                <a href="https://www.instagram.com/" target="_blank" class="projects__link">
                                    <i class='bx bxl-instagram'></i>View
                                </a>
                            </div>
                        </div>
                    </article>

                    <article class="projects__card">
                        <div class="projects__image">
                            <img src="Resources/Pharmacy101.jpg" alt="image not supported by browser"
                                class="projects__img">

                            <a title="Read more"
                                href="https://www.express-scripts.com/pharmacy/blog/refills-vs-renewals" target="_blank"
                                class="projects__button button">
                                <img src="Resources/rightup-black.png" alt="graphic not supported by browser">
                            </a>
                        </div>

                        <div class="projects__content">
                            <h3 class="projects__subtitle"><b>By EVERNORTH</b></h3>
                            <h2 class="project__title">What is a prescription refill?</h2>
                            <br />
                            <p class="projects__description">
                                Understanding the difference between a prescription refill
                                and a prescription renewal can save you...
                            </p>

                            <div class="projects__buttons">
                                <a href="https://www.linkedin.com/" target="_blank" class="projects__link">
                                    <i class='bx bxl-linkedin'></i>View
                                </a>

                                <a href="https://www.instagram.com/" target="_blank" class="projects__link">
                                    <i class='bx bxl-instagram'></i>View
                                </a>
                            </div>
                        </div>
                    </article>

                    <article class="projects__card">
                        <div class="projects__image">
                            <img src="Resources/Woman-drinking-water.jpg" alt="image not supported by browser"
                                class="projects__img">

                            <a title="Read more"
                                href="https://www.express-scripts.com/pharmacy/blog/pfizers-covid-19-pill-and-medication-interactions"
                                target="_blank" class="projects__button button">
                                <img src="Resources/rightup-black.png" alt="graphic not supported by browser">
                            </a>
                        </div>

                        <div class="projects__content">
                            <h3 class="projects__subtitle"><b>By EVERNORTH</b></h3>
                            <h2 class="project__title"><b>Paxlovid: Interactions, Side Effects & Risks</b></h2>
                            <br />
                            <p class="projects__description">
                                Paxlovid® is one of the most effective treatments
                                available to prevent severe COVID-19...
                            </p>

                            <div class="projects__buttons">
                                <a href="https://www.linkedin.com/" target="_blank" class="projects__link">
                                    <i class='bx bxl-linkedin'></i>View
                                </a>

                                <a href="https://www.instagram.com/" target="_blank" class="projects__link">
                                    <i class='bx bxl-instagram'></i>View
                                </a>
                            </div>
                        </div>
                    </article>

                    <article class="projects__card">
                        <div class="projects__image">
                            <img src="Resources/Two-women.jpg" alt="image not supported by browser"
                                class="projects__img">

                            <a title="Read more"
                                href="https://www.express-scripts.com/pharmacy/blog/mixing-medication-and-alcohol"
                                target="_blank" class="projects__button button">
                                <img src="Resources/rightup-black.png" alt="graphic not supported by browser">
                            </a>
                        </div>

                        <div class="projects__content">
                            <h3 class="projects__subtitle"><b>By EVERNORTH</b></h3>
                            <h2 class="project__title">Mixing Alcohol & Medication</h2>
                            <br />
                            <p class="projects__description">
                                The next time you reach for a glass of wine
                                at dinner or enjoy a few celebratory cocktails,
                                consi...
                            </p>

                            <div class="projects__buttons">
                                <a href="https://www.linkedin.com/" target="_blank" class="projects__link">
                                    <i class='bx bxl-linkedin'></i>View
                                </a>

                                <a href="https://www.instagram.com/" target="_blank" class="projects__link">
                                    <i class='bx bxl-instagram'></i>View
                                </a>
                            </div>
                        </div>
                    </article>

                    <article class="projects__card">
                        <div class="projects__image">
                            <img src="Resources/husband-wife.jpg" alt="image not supported by browser"
                                class="projects__img">

                            <a title="Read more"
                                href="https://www.express-scripts.com/pharmacy/blog/spring-clean-your-health"
                                target="_blank" class="projects__button button">
                                <img src="Resources/rightup-black.png" alt="image not supported by browser">
                            </a>
                        </div>

                        <div class="projects__content">
                            <h3 class="projects__subtitle"><b>By EVERNORTH</b></h3>
                            <h2 class="project__title">5 Ways to "Spring Clean" Your Health!</h2>
                            <br />
                            <p class="projects__description">
                                We often think of spring as a time of
                                rebirth and renewal. It’s the time of
                                year that we tend to clea...
                            </p>

                            <div class="projects__buttons">
                                <a href="https://www.linkedin.com/" target="_blank" class="projects__link">
                                    <i class='bx bxl-linkedin'></i>View
                                </a>

                                <a href="https://www.instagram.com/" target="_blank" class="projects__link">
                                    <i class='bx bxl-instagram'></i>View
                                </a>
                            </div>
                        </div>
                    </article>
                </div>
            </section>
        </main>
</asp:Content>
