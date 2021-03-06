// It uses data_handler.js to visualize elements
import { dataHandler } from "./data_handler.js";

export let dom = {
    init: function () {
        // This function should run once, when the page is loaded.
    },
    loadBoards: function () {
        // retrieves boards and makes showBoards called
        dataHandler.getBoards(function(boards){
            dom.showBoards(boards);
        });
    },
    showBoards: function (boards) {
        // shows boards appending them to #boards div
        // it adds necessary event listeners also
        let temp = document.getElementsByTagName("template")[0];
        for(let board of boards){
            temp.content.getElementById("board-header").innerText = `${board.boards_title}`;
            temp.content.querySelector(".board").id = `${board.boards_id}`;
            let clone = temp.content.cloneNode(true);
            document.body.appendChild(clone);
            dom.loadCards(board.boards_id);
        }

    },
    loadCards: function (boardId) {
        // retrieves cards and makes showCards called
        dataHandler.getCardsByBoardId(boardId, function(cards){
            dom.showCards(cards);
        });
    },
    showCards: function (cards) {
        // shows the cards of a board
        // it adds necessary event listeners also
        let temp = document.getElementsByTagName("template")[1];
        let boardList = document.querySelectorAll(".board");
        for (let element of boardList){
            for(let card of cards){
                if (element.id === `${card.boards_id}`){
                    temp.content.getElementById("card").innerText = `${card.cards_title}`;
                    let clone = temp.content.cloneNode(true);
                    element.querySelector(`#${card.statuses_id}`).appendChild(clone);
                }
        }





        }
        },

    // here comes more features
    loadStatus: function (statusId) {
        // retrieves statuses and makes showStatuses called
        dataHandler.getStatus(statusId, function(status){
            dom.showStatus(status);
        });
    },
    showStatus: function (status) {
        // shows the cards of a board
        // it adds necessary event listeners also
        let statusList = '';
        statusList += `<li>${status}</li>`;

        const outerHtml = `
            <ul class="status-container">
                ${statusList}
            </ul>
        `;

        let statusContainer = document.querySelector('#statuses');
        statusContainer.insertAdjacentHTML("beforeend", outerHtml);
    }
};
