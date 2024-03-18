class Rectangle:
    def __init__(self,width,height):
        self.width = width
        self.height = height

    def set_width(self):
        return self.width
    
    def set_height(self):
        return self.height

    def get_area(self):
        return self.width * self.height
    
    def get_perimeter(self): 
        return 2 * self.width + 2 * self.height
    
    def get_diagonal(self): #hypotenusa
        return (self.width ** 2 + self.height ** 2) ** .5
    
    def get_picture(self):
        width = []
        height = []
        if self.width < 50 or self.height < 50 :
            for i in range(self.width):
                width.append(1 * '*')
            height.append(self.height * '*')
        for key, value in enumerate(width):
            print(value)
            if len(width) == key + 1:
                print(height)
        else:
            return "Too big for picture."

    def get_amount_inside(self):
        return

class Square:
    def __init__(self,width,height):
        self.width = width
        self.height = height

    def set_side(self):
        return


if __name__ == '__main__':
    rect = Rectangle(10, 5)
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