﻿/*================ SHOW MENU ================ */
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


// Function to trigger the button click in the nth row
function triggerButtonClick(rowNumber) {
    const index = rowNumber - 1;

    const gridView = document.getElementById('<%= GridView1.ClientID %>');

    if (gridView) {
        const row = gridView.rows[index];
        if (row) {
            const button = row.querySelector('Button1');

            if (button) {
                button.click();
                console.log("Button clicked")
            } else {
                console.log("Button not found in row " + rowNumber);
            }
        } else {
            console.log("Row " + rowNumber + " not found.");
        }
    } else {
        console.log("GridView not found.");
    }
}

const shop = document.getElementById('shop')
const products = shop.querySelectorAll('button-light')

products.forEach(product => {
    product.addEventListener('click', () => {
        let row = product.getAttribute('data-prod-id')
        triggerButtonClick(row)
    });
});