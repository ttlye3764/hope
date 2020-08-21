package kr.or.ddit.aop;

import java.lang.reflect.Field;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.config.BeanPostProcessor;
import org.springframework.stereotype.Component;
import org.springframework.util.ReflectionUtils;
import org.springframework.util.ReflectionUtils.FieldCallback;

@Component
public class LoggerInjector implements BeanPostProcessor {

   // 
   @Override
   public Object postProcessAfterInitialization(Object registedBeanOBJ, 
                                     String registedBeanName)
         throws BeansException {
      // 루트 컨텍스트 또는 서블릿 컨텍스트를 생성하기 위해 활용되는 각각의 
      // 설정파일 내 선언된 빈의 인스턴스화 및 빈 등록이 완료된 직후 
      // 콜백되는 메서드(전체 설정 파일 내 빈 선언된 클래스 각각의 빈 등록시 마다 콜백)
      // return null => 빈 등록 취소
      return registedBeanOBJ;
   }

   @Override
   public Object postProcessBeforeInitialization(final Object beforeRegistBeanOBJ, 
                                      String beforeRegistBeanName)
         throws BeansException {
      // 루트 컨텍스트 또는 서블릿 컨텍스트를 생성하기 위해 활용되는 각각의 
      // 설정파일 내 선언된 빈의 인스턴스화 및 빈 등록 직전 
      // 콜백되는 메서드(전체 설정 파일 내 빈 선언된 클래스 각각의 빈 등록시 마다 콜백)
      
      // doWithFields() : 빈 등록 대상의 클래스 내 전체 전역변수를 리스트로 취득
      //                 취득한 전역변수 각각에 접근시 FieldCallback.doWith(금번에 접근하는 전역변수)을 활용
      ReflectionUtils.doWithFields(beforeRegistBeanOBJ.getClass(), new FieldCallback() {
         
         @Override
         public void doWith(Field field) throws IllegalArgumentException,
               IllegalAccessException {
            // 해당 전역변수 상단에 @Loggable 선언 여부 파악
            // private 접근 지정자가 선언된 전역변수 대상 외부 접근 허용
            ReflectionUtils.makeAccessible(field);
            
            // 해당 전역변수 상단 @Loggable 선언 : Not null
            // 해당 전역변수 상단 @Loggable 미선언 : null
            if (field.getAnnotation(Loggable.class) != null) {
               Logger logger = LoggerFactory.getLogger(beforeRegistBeanOBJ.getClass());
               field.set(beforeRegistBeanOBJ, logger);
            }
         }
      });
      
      // return null => 빈 등록 취소
      return beforeRegistBeanOBJ;
   }

}
