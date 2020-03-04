import persistence


def get_card_status(status_id):
    """
    Find the first status matching the given id
    :param status_id:
    :return: str
    """
    statuses = persistence.get_statuses()
    return next((status['statuses_title'] for status in statuses if status['statuses_id'] == status_id), 'Unknown')


def get_boards():
    """
    Gather all boards
    :return:
    """
    return persistence.get_boards(force=True)


def get_cards_for_board(board_id):
    persistence.clear_cache()
    all_cards = persistence.get_cards()
    matching_cards = []
    for card in all_cards:
        if card['boards_id'] == board_id:
            card['statuses_id'] = get_card_status(card['statuses_id'])  # Set textual status for the card
            matching_cards.append(card)
    return matching_cards
