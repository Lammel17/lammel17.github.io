
//create header-----------------------------------------------
const navigation = document.getElementById("navigation");

if (navigation) {
    navigation.innerHTML = `
        <div class="topnav" id="myTopnav">
            <a href="/index.html" class="rightVerticalLine">Main Page</a>
            <a href="/My-Projects.html">All Projects</a>
            <a href="/My-Art.html">All Artworks</a>
            <a href="/About-Me.html">About Me</a>
            <a href="/Contact.html">Contact</a>
            <a href="#" class="icon leftVerticalLine" id="menuButton">
                <img src="/img/menu.png"
                     height="30"
                     width="30"
                     alt="Menu Button">
            </a>
        </div>
    `;

    document.getElementById("menuButton").addEventListener("click", myFunction);
}


//create footer-----------------------------------------------
createContactSection();

function createContactSection() {
    const contact = document.getElementById("contactSection");

    if (!contact) return;

    contact.innerHTML = `
        <div class="textBubbleDiv hoverable" id="emailCopy">
            <span class="email">- lukaskonstanz@web.de -</span>
        </div>

        <div class="contact">
            <div class="contact-body mainTextField">
                <p>
                    Tap the email address to copy it, or
                    <i>
                        <a href="/Contact.html">
                            check out the contact page here.
                        </a>.
                    </i>
                </p>
            </div>
        </div>
    `;

    const emailCopy = document.getElementById("emailCopy");

    emailCopy.addEventListener("click", () => {
        copyEmail(emailCopy.querySelector(".email"));
    });
}



//unfold header-----------------------------------------------
function myFunction() {
    var x = document.getElementById("myTopnav");
    if (x.className === "topnav") {
        x.className += " responsive";
    } else {
        x.className = "topnav";
    }
}

const menuButton = document.querySelector(".topnav .icon");

if (menuButton != null) {
    menuButton.addEventListener("click", myFunction);
}



//open and close images-----------------------------------------------

function openPopup(image) {
    const popup = document.getElementById("imagePopup");
    const popupImage = document.getElementById("popupImage");

    popupImage.src = image.src;
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




//favourite project and artworks-----------------------------------------------
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
            <img src="artworks/${filename}" alt="" loading="lazy" class="popupImage">
        </div>
    `;

    grid.appendChild(tile);
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