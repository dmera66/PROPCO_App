package com.propco.rts.service.v1;

public interface Service {
	
	void save(Object object);
	
	void update(Object object);
	
	void delete(Object object);
	
	Object findByStockCode(String objectID);
}
