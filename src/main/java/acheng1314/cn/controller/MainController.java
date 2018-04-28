package acheng1314.cn.controller;

import acheng1314.cn.domain.Theaters;
import acheng1314.cn.service.*;
import acheng1314.cn.util.Const;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;

import java.io.Serializable;

@RestController
@RequestMapping("/v2/movie")
public class MainController {

    @Autowired
    private TheatersServiceImpl theatersService;
    @Autowired
    private ComingServiceImpl comingService;
    @Autowired
    private TopServiceImpl topService;
    @Autowired
    private SearchServiceImpl searchService;

    @GetMapping(value = "/in_theaters", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    public Object getTheaters(@RequestParam(value = "city", required = false) String city
            , @RequestParam(value = "count", required = false) Integer count
            , @RequestParam(value = "start", required = false) Integer start) {
        if (city == null) return Const.theartersData;
        if (start == null) start = 1;
        try {
            Theaters theaters = theatersService.selectByCity(city, start);
            if (null == theaters) return Const.theartersData;
            return theaters.getData();
        } catch (Exception e) {
            e.printStackTrace();
            return Const.theartersData;
        }
    }

    @GetMapping(value = "/coming_soon", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    public Object getComingSoon(@RequestParam(value = "start", required = false) Integer start) {
        if (start == null) start = 1;
        try {
            return comingService.selectByDate(start).getData();
        } catch (Exception e) {
            e.printStackTrace();
            return Const.comingSoonData;
        }
    }

    @GetMapping(value = "/top250", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    public Object getTop() {
        try {
            return topService.selectByDate().getData();
        } catch (Exception e) {
            e.printStackTrace();
            return Const.topData;
        }
    }

    @GetMapping(value = "/search", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    public Object getSearch(@RequestParam(value = "q", required = false) String q, @RequestParam(value = "tag", required = false) String tag) {
        String keyword = (q == null ? tag : q);
        try {
            if (keyword == null) return Const.searchData;
            return searchService.selectByKeyword(keyword, q == null ? "tag" : "q").getData();
        } catch (Exception e) {
            e.printStackTrace();
            return Const.searchData;
        }
    }

    @Autowired
    private SubjectServiceImpl subjectService;

    @GetMapping(value = "/subject/{id}", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    public Object getSubject(@PathVariable(value = "id", required = false) Long id) {
        try {
            if (id == null) return Const.subjectData;
            return subjectService.findById(id).getData();
        } catch (Exception e) {
            e.printStackTrace();
            return Const.subjectData;
        }
    }

    @Autowired
    private CelebrityServiceImpl celebrityService;

    @GetMapping(value = "/celebrity/{id}", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    public Object getCelebrity(@PathVariable(value = "id", required = false) Long id) {
        try {
            if (id == null) return Const.celebrityData;
            return celebrityService.findById(id).getData();
        } catch (Exception e) {
            e.printStackTrace();
            return Const.celebrityData;
        }
    }


}
