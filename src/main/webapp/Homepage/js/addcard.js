function add_to_cart(pid, pname, price)
{
	
	let cart = localStorage.getItem("cart");
	if (cart == null)
	{
		//no cart yet
		let products = [];
		let product = (productId: pid, productName: pname, productQuantity:  1, productPrice: price);
		products.push(product);
		localStorage.setItem("cart",JSON.stringify(products)); 
	}else
	{
		//cart is already present
		let pcart = JSON.parse(cart);
		
		let oldproduct = pcart.find((item)=> item.productId = pid)
		if(oldproduct)
		{
			//we have to increase the quantity
			oldproduct.productQuantity=oldproduct.productQuantity+1
			pcart.map(item) => {
				if(item.productId == oldproduct.productId){
					item.productQuantity = oldproduct.productQuantity; 
				}
			})
			localStorage.setItem("card",JSON.stringify(pcart));
		}else
		{
			// we have add the product
			let product = (productId: pid, productName: pname, productQuantity:  1, productPrice: price);
			pcart.push(product);
			localStorage.setItem("cart",JSON.stringify(pcart));
		}
		
	}
}