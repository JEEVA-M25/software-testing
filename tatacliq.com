//runner
package runner;

import java.net.MalformedURLException;

import org.testng.annotations.AfterClass;
import org.testng.annotations.AfterMethod;
import org.testng.annotations.BeforeClass;
import org.testng.annotations.BeforeMethod;
import org.testng.annotations.Test;

import com.aventstack.extentreports.ExtentReports;

import pages.Page1;
import utils.Base;
import utils.Reporter;

public class TestRunner extends Base{

    ExtentReports reports;
    Page1 page1;

    @BeforeClass
    public void  generateReport()
    {
        reports = Reporter.generateExtentReport("tatacliq report");
    }

    @BeforeMethod
    public void launchBrowser() throws MalformedURLException{
        openBrowser();
        page1 = new Page1(reports, driver);
    }

    @Test
    public void testOne() {
        page1.performtest();
    }
    
    @AfterMethod
    public void tearDown() {
        if(driver!=null)
        driver.quit();
    }
    @AfterClass
    public void flushReport()
    {
        if(reports != null)
        reports.flush();
    }
}


//pages

package pages;

import java.io.IOException;

import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebDriver;

import com.aventstack.extentreports.ExtentReports;
import com.aventstack.extentreports.ExtentTest;

import uistore.Ui;
import utils.LoggerHandler;
import utils.Screenshot;
import utils.WebDriverHelper;

public class Page1 {
 
    WebDriverHelper helper;
    WebDriver driver;
    ExtentTest test;
    
    public Page1(ExtentReports reports, WebDriver driver)
    {
        this.driver = driver;
        helper = new WebDriverHelper(driver);
        test = reports.createTest("myTest1");
    }
    public void performtest()
    {
        try{

            helper.waitForElementToBeClickable(Ui.noThanks, 10);
            helper.clickOnElement(Ui.noThanks);
            Thread.sleep(6000);

            helper.javascriptScroll(Ui.contact);
            helper.clickOnElement(Ui.contact);
            Thread.sleep(6000);

            helper.waitForElementToBeClickable(Ui.cliqCare, 10);
            helper.clickOnElement(Ui.cliqCare);
            Screenshot.getScreenShot(driver, "myScreenshot.png");
            LoggerHandler.initLog4j();

            LoggerHandler.logTrace("This is a trace message");

        }
        catch(InterruptedException | IOException e)
        {
            e.printStackTrace();
        }
    }
}
