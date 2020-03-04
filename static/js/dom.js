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

        let boardList = '';

        for(let board of boards){
            boardList += `
                <li>${board.boards_title}</li>
            `;
        }

        const outerHtml = `
            <ul class="board-container">
                ${boardList}
            </ul>
        `;

        let boardsContainer = document.querySelector('#boards');
        boardsContainer.insertAdjacentHTML("beforeend", outerHtml);
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
        let cardList = '';

        for(let card of cards){
            cardList += `
                <li>${card.cards_title}</li>
            `;
        }

        const outerHtml = `
            <ul class="card-container">
                ${cardList}
            </ul>
        `;

        let cardsContainer = document.querySelector('#cards');
        cardsContainer.insertAdjacentHTML("beforeend", outerHtml);
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
