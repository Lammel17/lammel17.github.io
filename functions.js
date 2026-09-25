
// create header
const navigation = document.getElementById("navigation");

if (navigation) {
    navigation.innerHTML = `

<div class="topnav" id="myTopnav">

    <div class="navSide navLeft">
        <a href="/index.html" class="navIcon rightVerticalLine">
            <img src="/img/faviconPlainSmall.png" alt="Home">
        </a>
    </div>

    <div class="navCenter">
        <!-- 
        <a href="/somewhere.html" class="navIcon">
            <img src="/img/faviconPlainSmall.png" alt="Something">
        </a>

        <a href="/another.html" class="navIcon">
            <img src="/img/faviconPlainSmall.png" alt="Another">
        </a> 
        -->
    </div>

    <div class="navSide navRight">
        <div class="menuContainer">
            <a href="#" class="navIcon leftVerticalLine" id="menuButton">
                <img src="/img/menu.png" alt="Menu">
            </a>

            <div class="dropdownMenu">
                <a href="/index.html">Home</a>
                <a href="/My-Projects.html">Projects</a>
                <a href="/My-Art.html">Artworks</a>
                <a href="/About-Me.html">About Me</a>
                <a href="/Contact.html">Contact</a>
            </div>
        </div>
    </div>

</div>


    `;
}


//create footer-----------------------------------------------
createContactSection();

function createContactSection() {
    const contact = document.getElementById("contactSection");

    if (!contact) return;

    contact.innerHTML = `
        <div class="textBubbleDiv hoverable" id="emailCopy">
            <span class="email"> &#108;&#117;&#107;&#97;&#115;&#107;&#111;&#110;&#115;&#116;&#97;&#110;&#122;&#64;&#119;&#101;&#98;&#46;&#100;&#101; </span>
        </div>

        <div class="contact">
            <div class="contact-body mainTextField">
                <p>
                    Tap the email address to copy it, or
                    <i>
                        <a href="/Contact.html">
                            check out the contact page here
                        </a>.
                    </i>
                </p>
                <p>
                     <a href="/Legal-Notice.html">Legal Notice & Privacy Policy</a> · Lukas Müller © 2026 - All rights reserved
                </p>
            </div>
        </div>
    `;

    const emailCopy = document.getElementById("emailCopy");

    emailCopy.addEventListener("click", () => {
        copyEmail(emailCopy.querySelector(".email"));
    });
}

//copy mail-----------------------------------------------
function copyEmail(element) {
    navigator.clipboard.writeText(element.textContent.trim());

    const originalText = element.textContent;
    element.textContent = "Copied!";

    setTimeout(() => {
        element.textContent = originalText;
    }, 1500);
}

const emailCopy = document.getElementById("emailCopy");

if (emailCopy) {
    emailCopy.addEventListener("click", () => {
        copyEmail(emailCopy.querySelector("span"));
    });
}





//open and close images-----------------------------------------------

function openPopup(image) {
    const popup = document.getElementById("imagePopup");
    const popupImage = document.getElementById("popupImage");

    if (image.dataset.original == null){
        popupImage.src = image.src;
    }
    else {
        popupImage.src = image.dataset.original;
    }
    
    popupImage.alt = image.alt;

    popup.style.display = "flex";
}

function closePopup() {
    document.getElementById("imagePopup").style.display = "none";
}

document.addEventListener("click", (event) => {
    if (event.target.matches(".popupImage")) {
        openPopup(event.target);
    }
});

const popup = document.getElementById("imagePopup");
if (popup) {
    popup.addEventListener("click", (event) => {
        closePopup();
    });
}




//project and artworks-----------------------------------------------
import { favouriteProjects } from "./projects-list.js";
import { favouriteArtworks } from "./artworks-list.js";
import { allProjects } from "./projects-list.js";
import { allArtworks } from "./artworks-list.js";

const favouriteProjectsGrid = document.getElementById("gridFavouriteProjects");
const favouriteArtworksGrid = document.getElementById("gridFavouriteArtworks");
const allProjectsGrid = document.getElementById("gridAllProjects");
const allArtworksGrid = document.getElementById("gridAllArtworks");

favouriteProjects.forEach(projectP => { createProjectTile(projectP, favouriteProjectsGrid); });
favouriteArtworks.forEach(filenameP => { createArtworkTile(filenameP, favouriteArtworksGrid); });
allProjects.forEach(project => { createProjectTile(project, allProjectsGrid); });
allArtworks.forEach(filename => { createArtworkTile(filename, allArtworksGrid); });



//projects-----------------------------------------------
function createProjectTile(project, gridP) {
    if (gridP == null || project == null)
        return;

    const tileP = document.createElement("a");

    tileP.className = "gridProjectTile";
    tileP.href = project.page;

    tileP.innerHTML = `
    <div class="hoverable">
    <div class="category category-${project.categoryClass}"> 
    ${project.category}
    </div>
    <img src="${project.image}" alt="${project.name}" loading="lazy">
    
    <div class="card-body">
    <div class="title">${project.name}</div>
    <div class="description">${project.description}</div>
                            </div>
                    </div>
                `;

    gridP.appendChild(tileP);
};


//artworks-----------------------------------------------
function createArtworkTile(filename, grid) {
    if (grid == null || filename == null)
        return;

    const tile = document.createElement("div");

    tile.className = "gridArtworkTile";

    tile.innerHTML = `
        <div class="hoverable">
            <img src="artworks/compressedImages/${filename}" 
            data-original="artworks/${filename}"
            alt="" loading="lazy" class="popupImage">
        </div>
    `;

    grid.appendChild(tile);
}

