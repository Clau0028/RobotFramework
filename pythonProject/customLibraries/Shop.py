from robot.api.deco import library, keyword
from robot.libraries.BuiltIn import BuiltIn

@library
class Shop:

    def __init__(self):
        self.selLib = BuiltIn().get_library_instance("SeleniumLibrary")

    @keyword
    def add_items_to_cart_and_checkout(self, products_list):
        i = 1
        products_titles = self.selLib.get_webelements("xpath:(//h4[@class='card-title'])")
        for productsTitle in products_titles:
            if productsTitle.text in products_list:
                self.selLib.click_button("xpath://app-card[" + str(i) + "]//div[1]//div[2]//button[1]")

            i = i + 1

        self.selLib.click_link("xpath://a[@class='nav-link btn btn-primary']")

