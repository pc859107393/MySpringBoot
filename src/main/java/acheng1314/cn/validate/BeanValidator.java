package acheng1314.cn.validate;

import javax.validation.ConstraintViolation;
import javax.validation.Validation;
import javax.validation.ValidationException;
import javax.validation.Validator;
import java.util.Set;

import static com.google.common.collect.Iterables.getFirst;

public class BeanValidator {
    public static <T extends Object> void validate(T bean) {
        //获得验证器
        Validator validator = Validation.buildDefaultValidatorFactory().getValidator();
        //执行验证
        Set<ConstraintViolation<T>> validate = validator.validate(bean);
        //如果有验证信息，则将第一个取出来包装成异常返回
        ConstraintViolation<T> violation = getFirst(validate, null);
        if (violation != null) {
            throw new ValidationException(violation.getMessage());
        }
    }
}
