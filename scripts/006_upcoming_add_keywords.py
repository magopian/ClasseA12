"""Update the `upcoming` collection to accept new keywords.

Added keywords:
- "CP"
- "CE1"

Requirements: kinto_http

$ pip install kinto_http

To use: run the following

$ python 005_upcoming_add_keywords.py --auth "<admin login>:<admin password>"

"""

import base64
import json
import os
import pprint
import urllib.request

from kinto_http import cli_utils
from kinto_http.exceptions import KintoException

import collections_metadata

DEFAULT_SERVER = "https://kinto.agopian.info/v1/"
DEFAULT_BUCKET = "classea12"
DEFAULT_COLLECTION = "upcoming"


def main():
    parser = cli_utils.add_parser_options(
        description="Update the 'upcoming' collection to accept new keywords",
        default_server=DEFAULT_SERVER,
        default_bucket=DEFAULT_BUCKET,
        default_collection=DEFAULT_COLLECTION,
    )

    args = parser.parse_args()

    client = cli_utils.create_client_from_args(args)

    print("Updating the collection")
    collections_metadata.update_upcoming(client)


if __name__ == "__main__":
    main()
