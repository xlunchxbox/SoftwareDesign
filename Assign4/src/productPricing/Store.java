package productPricing;

import java.util.*;

import java.util.HashMap;
import java.util.Map;


public class Store
{
	private Map<String, Double> productPrices;
	private Map<String, Double> taxAreasRates;
	private Map<String, Double> productTaxAreasReduction;
	
	
	public Store(Map<String, Double>  prices, Map<String, Double>  taxes, Map<String, Double>  reduction)
	{
		productPrices = prices;
		taxAreasRates = taxes;
		productTaxAreasReduction = reduction;
	}

	
	public Double getPrice(ArrayList<String> products, String location)
	{
		ArrayList<Double> prices = new ArrayList<Double>();
		Double totalSale = 0.0;
		
		for(String productName : products)
		{
			if (taxRate(location) == 0)
				prices.add(0.0);
			else
			{
				prices.add(getPriceForProduct(productName) * 
					(1 + taxRate(location) - getReduction(productName, location)));
			}
			
		}
		totalSale = getTotalSale(prices);
		
		return totalSale;
	}
	
	public Double getTotalSale(ArrayList<Double> saleItems)
	{
		Double totalSale = 0.0;
		
		for(Double items : saleItems)
		    totalSale += items;
		
		return totalSale;
	}
	
	public double getReduction(String productName, String location)
	{   
		if(productTaxAreasReduction.get(productName + location) != null)
			return productTaxAreasReduction.get(productName + location);
		else 
			return 0.0;
	}
	
	
	public double taxRate(String location)
	{  
		if (taxAreasRates.get(location) != null)
			return taxAreasRates.get(location);
		else
			return 0.0;
	}
	
	
	public double getPriceForProduct(String productName)
	{
		if (productPrices.get(productName) != null)
			return productPrices.get(productName);
		else
			return 0.0;
	}
}