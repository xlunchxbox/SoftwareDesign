package productPricing;

import junit.framework.*;
import java.util.*;

public class StoreTest extends TestCase
{
	Store heb;
    Map<String, Double> productPrices;
    Map<String, Double> taxAreasRates;
    Map<String, Double> productTaxAreasReduction;
    
	ArrayList<String> products;
	ArrayList<Double> prices;
	
	protected void setUp()
	{
		productPrices = new HashMap<String, Double >()
		{{
			put("TShirt", 10.0);
			put("souvenir", 20.0);
		}};
        
		taxAreasRates = new HashMap<String, Double >()
		{{
			put("TX", 0.0825);
			put("CA", 0.0750);
		}};
                
		productTaxAreasReduction = new HashMap<String, Double >()
		{{
			put("souvenirCA", 0.1);
			put("TShirtCA", 0.1);
		}};
        
        
		heb = new Store(productPrices, taxAreasRates, productTaxAreasReduction);
        
        
		products = new ArrayList<String>();
		products.addAll(Arrays.asList("TShirt", "souvenir"));
		
		prices = new ArrayList<Double>();
		prices.addAll(Arrays.asList(10.0, 20.0, 30.0));
	}
	
	
	public void testCanary()
	{
		assertTrue(true);
	}
	

	public void testListOfProductsForTxandNoReduction()
	{
		Assert.assertEquals(32.474d, heb.getPrice(products, "TX"), 0.005d);
	}
	
		
	public void testListOfProductsForCAWithReduction()
	{
		assertEquals(29.25, heb.getPrice(products, "CA"));
	}
	
	public void testGetTaxRateForValidLocation()
	{
		assertEquals(0.0825, heb.taxRate("TX"));
	}
	
	public void testGetTaxRateForInvalidLocation()
	{
		assertEquals(0.0, heb.taxRate("NY"));
	}
	
	
	public void testGetPriceForValidProduct()
	{
		assertEquals(10.0, heb.getPriceForProduct("TShirt"));
	}
	
	public void testGetPriceForInvalidProduct()
	{
		assertEquals(0.0, heb.getPriceForProduct("Coke"));
	}
	
	

	public void testInvalidProduct()
	{
		products.clear();
		products.add("grill");

		assertEquals(0.0, heb.getPrice(products, "TX"));
	}
	
	
	public void testInvalidLocation()
	{
		products.clear();
		products.add("TShirt");
		
		assertEquals(0.0, heb.getPrice(products, "CO"));
	}
	
	
	public void testTotalSalesPrice()
	{
		assertEquals(60.0, heb.getTotalSale(prices));
	}
}

