package com.util;

import java.io.File;
import java.util.ArrayList;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import org.w3c.dom.Attr;
import org.w3c.dom.Document;
import org.w3c.dom.Element;

public class DomParsing {

    ArrayList quantities_in_cart = new ArrayList();
    ArrayList products_in_cart_list = new ArrayList();

    public static void card_n_shipping_info(String card_type, String card_name, String expiration_month, String expiration_year, String fullname, String address, String country, String zipcode) {
        try {
            DocumentBuilderFactory docFactory = DocumentBuilderFactory.newInstance();
            DocumentBuilder docBuilder = docFactory.newDocumentBuilder();

            // root elements
            Document doc = docBuilder.newDocument();
            Element rootElement = doc.createElement("CustomerInfo");
            doc.appendChild(rootElement);

            Element payinfo = doc.createElement("Credit_Card_Details");
            rootElement.appendChild(payinfo);
                
                Element typeofcard = doc.createElement("Card_Type");                
                typeofcard.appendChild(doc.createTextNode(card_type));
                payinfo.appendChild(typeofcard);
                
                Element cardname = doc.createElement("Name_on_Card");                
                cardname.appendChild(doc.createTextNode(card_name));
                 payinfo.appendChild(cardname);
                 
               Element month = doc.createElement("Month");                               
               month.appendChild(doc.createTextNode(expiration_month));
               payinfo.appendChild(month);
               
               Element year = doc.createElement("Year");                               
               year.appendChild(doc.createTextNode(expiration_year));
               payinfo.appendChild(year);
                
                Element billinginfo = doc.createElement("Shipping_Address");
                rootElement.appendChild(billinginfo);
                
                Element name = doc.createElement("Fullname");
                name.appendChild(doc.createTextNode(fullname));
                billinginfo.appendChild(name); 
                
                Element cus_address = doc.createElement("Address");
                cus_address.appendChild(doc.createTextNode(address));
                billinginfo.appendChild(cus_address);
                
                Element Country = doc.createElement("Country");
                Country.appendChild(doc.createTextNode(country));
                billinginfo.appendChild(Country);
                
                Element Zipcode = doc.createElement("Zipcode");
                Zipcode.appendChild(doc.createTextNode(zipcode));
                billinginfo.appendChild(Zipcode);
            // write the content into xml file
            TransformerFactory transformerFactory = TransformerFactory.newInstance();
            Transformer transformer = transformerFactory.newTransformer();
            DOMSource source = new DOMSource(doc);
            StreamResult result = new StreamResult(new File("C:\\Users\\HP\\mydb\\shipping_payment_info.xml"));

            // Output to console for testing
            // StreamResult result = new StreamResult(System.out);

            transformer.transform(source, result);

            System.out.println("File saved!");

        } catch (ParserConfigurationException pce) {
            pce.printStackTrace();
        } catch (TransformerException tfe) {
            tfe.printStackTrace();
        }
    }

    public static void writexml(ArrayList quantities_in_cart, ArrayList products_in_cart_list) {
        try {
            DocumentBuilderFactory docFactory = DocumentBuilderFactory.newInstance();
            DocumentBuilder docBuilder = docFactory.newDocumentBuilder();

            // root elements
            Document doc = docBuilder.newDocument();
            Element rootElement = doc.createElement("ShoppingCart");
            doc.appendChild(rootElement);

            // staff elements..creating a for loop to get the number of elements in the cart
            for (int i = 0; i < products_in_cart_list.size(); i++) {
                Element item = doc.createElement("item");
                rootElement.appendChild(item);

                // set attribute to staff element
                Attr attr = doc.createAttribute("item_id");
                attr.setValue(String.valueOf(i + 1));
                item.setAttributeNode(attr);

                // shorten way
                // staff.setAttribute("id", "1");

                // firstname elements
                Element itemname = doc.createElement("ItemName");
                itemname.appendChild(doc.createTextNode((String) products_in_cart_list.get(i)));
                item.appendChild(itemname);

                // lastname elements
                Element quantity = doc.createElement("Quantity");
                quantity.appendChild(doc.createTextNode((String) quantities_in_cart.get(i)));
                item.appendChild(quantity);
            }

            // write the content into xml file
            TransformerFactory transformerFactory = TransformerFactory.newInstance();
            Transformer transformer = transformerFactory.newTransformer();
            DOMSource source = new DOMSource(doc);
            StreamResult result = new StreamResult(new File("C:\\Users\\HP\\mydb\\order_items.xml"));

            // Output to console for testing
            // StreamResult result = new StreamResult(System.out);

            transformer.transform(source, result);

            System.out.println("File saved!");

        } catch (ParserConfigurationException pce) {
            pce.printStackTrace();
        } catch (TransformerException tfe) {
            tfe.printStackTrace();
        }
    }
}
