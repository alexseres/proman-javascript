import { dom } from "./dom.js";

// This function is to initialize the application
function init() {
    // init data
    dom.init();
    // loads the boards to the screen
    dom.loadBoards();
    //dom.loadStatus(3);
    //dom.loadCards(1);

}

init();
