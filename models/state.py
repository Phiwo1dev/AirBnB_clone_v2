#!/usr/bin/python3
"""defines the State class."""
import models
from os import getenv
from models.base_model import Base
from models.base_model import BaseModel
from sqlalchemy import String
from models.city import City
from sqlalchemy import Column
from sqlalchemy.orm import relationship


class State(BaseModel, Base):
    """represents a state for a MySQL database.

    inherits from SQLAlchemy Base and links to the MySQL table states.

    Attributes:
        __tablename__ (str): Name of the MySQL table to store States.
        name (sqlalchemy String): The name of the State.
        cities (sqlalchemy relationship): State-City relationship.
    """
    __tablename__ = "states"
    name = Column(String(128), nullable=False)
    cities = relationship("City",  backref="state", cascade="delete")

    if getenv("HBNB_TYPE_STORAGE") != "db":
        @property
        def cities(self):
            """Gets a list of all related City objects."""
            city_list = []
            for city in list(models.storage.all(City).values()):
                if city.state_id == self.id:
                    city_list.append(city)
            return city_list
