package acheng1314.cn;

import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@SpringBootTest(classes = Application.class)
public abstract class BaseTest {

    public void loge(String msg) {
        System.out.println("\n====>\t\t" + msg + "\n\t\t=====>over");
    }

}
