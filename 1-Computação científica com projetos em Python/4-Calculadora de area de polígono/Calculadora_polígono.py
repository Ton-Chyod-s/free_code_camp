class Rectangle:
    def __init__(self,width,height):
        self.width = width
        self.height = height

    def set_width(self):
        pass
    
    def set_height(self):
        pass

    def get_area(self):
        return self.width * self.height
    
    def get_perimeter(self):
        return 2 * self.width + 2 * self.height
    
    def get_diagonal(self):
        return (self.width ** 2 + self.height ** 2) ** .5
    
    def get_picture(self):
        pass

    def get_amount_inside(self):
        pass

class Square:
    def __init__(self,width,height):
        self.width = width
        self.height = height

    def set_side(self):
        pass


if __name__ == "__init__":
    rect = Rectangle(10, 5)
    print(rect.get_area())
    rect.set_height(3)
    print(rect.get_perimeter())
    print(rect)
    print(rect.get_picture())

    sq = Square(9)
    print(sq.get_area())
    sq.set_side(4)
    print(sq.get_diagonal())
    print(sq)
    print(sq.get_picture())

    rect.set_height(8)
    rect.set_width(16)
    print(rect.get_amount_inside(sq))