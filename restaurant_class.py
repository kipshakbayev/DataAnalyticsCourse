class Restaurant():
    def __init__(self, restaurant_name, cuisine_type):
        self.name = restaurant_name
        self.type = cuisine_type
        
    def describe_restaurant(self):
        print(f"Название ресторана: {self.name.title()}, кухня: {self.type.title()}")
        
    def open_restaurant(self):
        print(f"Ресторан с названием {self.name.title()} открыт")