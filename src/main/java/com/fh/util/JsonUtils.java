package com.fh.util;

import org.codehaus.jackson.JsonGenerator;
import org.codehaus.jackson.JsonProcessingException;
import org.codehaus.jackson.map.JsonSerializer;
import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.map.SerializerProvider;
import org.codehaus.jackson.type.JavaType;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.List;

public class JsonUtils {

	/**
	 * Obj2JsonString
	 * 
	 * @param obj
	 * @return
	 */
	public static String objToJson(Object obj) throws Exception {

		ObjectMapper mapper = new ObjectMapper();

		SimpleDateFormat dateFormat = new SimpleDateFormat(
				"yyyy-MM-dd HH:mm:ss");

		mapper.setDateFormat(dateFormat);

		mapper.getSerializerProvider().setNullValueSerializer(
				new JsonSerializer<Object>() {

					@Override
					public void serialize(Object arg0, JsonGenerator jg,
                                          SerializerProvider sp) throws IOException,
                            JsonProcessingException {
						jg.writeString("");
					}
				});
		return mapper.writeValueAsString(obj);
	}

	public static <T> T jsonToObj(String json, Class<T> clz) throws Exception {
		ObjectMapper mapper = new ObjectMapper();

		SimpleDateFormat dateFormat = new SimpleDateFormat(
				"yyyy-MM-dd HH:mm:ss");

		mapper.setDateFormat(dateFormat);

		return mapper.readValue(json, clz);

	}

	/**
	 * 转换json为Collection
	 * 
	 * @param json
	 * @param clz
	 * @return
	 */
	public static <T> List<T> jsonToList(String json, Class<T> clz)
			throws Exception {
		ObjectMapper mapper = new ObjectMapper();
		JavaType javaType = mapper.getTypeFactory().constructParametricType(
				List.class, clz);
		List<T> beanList = mapper.readValue(json, javaType);

		return beanList;
	}
}
