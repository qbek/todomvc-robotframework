from SeleniumLibrary import SeleniumLibrary
from robot.api import logger
from robot.api.deco import keyword


class SeleniumWrapper(SeleniumLibrary):

    @keyword
    def findInsideElement(self, selector, element):
        logger.console(f"Selector: {selector}")
        logger.console(f"Element: {element}")
        return self.find_element(selector, element)
