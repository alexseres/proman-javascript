import csv

from util import connection_handler

STATUSES = """Select * from statuses"""
BOARDS = """Select * from boards"""
CARDS = """Select * from cards"""

_cache = {}  # We store cached data in this dict to avoid multiple file readings


@connection_handler
def get_query(cursor, table):
    cursor.execute(table)
    query = cursor.fetchall()
    return query


def _get_data(data_type, table, force):
    """
    Reads defined type of data from file or cache
    :param data_type: key where the data is stored in cache
    :param table: relative path to data file
    :param force: if set to True, cache will be ignored
    :return: OrderedDict
    """
    if force or data_type not in _cache:
        _cache[data_type] = get_query(table)
    return _cache[data_type]


def clear_cache():
    for k in list(_cache.keys()):
        _cache.pop(k)


def get_statuses(force=False):
    return _get_data('statuses', STATUSES, force)


def get_boards(force=False):
    return _get_data('boards', BOARDS, force)


def get_cards(force=False):
    return _get_data('cards', CARDS, force)
