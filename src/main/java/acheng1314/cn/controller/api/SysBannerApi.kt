package acheng1314.cn.controller.api

import acheng1314.cn.domain.Banner
import acheng1314.cn.domain.ResponseCode
import acheng1314.cn.service.BannerServiceImpl
import acheng1314.cn.util.GsonUtil
import io.swagger.annotations.Api
import io.swagger.annotations.ApiOperation
import io.swagger.annotations.ApiParam
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.http.MediaType
import org.springframework.web.bind.annotation.*

@Api(description = "后台管理轮播图的API接口，需要用户登录权限！")
@RestController
@RequestMapping("/endSys/api/banner")
class SysBannerApi {
    @Autowired private lateinit var bannerService: BannerServiceImpl

    val bannerList: Any
        @ApiOperation(value = "获取轮播图的集合", notes = "轮播图查询")
        @GetMapping(value = ["/all"], produces = [(MediaType.APPLICATION_JSON_UTF8_VALUE)])
        @ResponseBody
        get() {
            return try {
                if (!this::bannerService.isInitialized) {
                    GsonUtil.toJsonObjStr(null, ResponseCode.EMPTY, "错误：内部组件初始化失败！")
                } else {
                    val all = bannerService.findAll()
                    if (all.isNotEmpty()) GsonUtil.toJsonObjStr(all, ResponseCode.OK, "查找成功")
                    else GsonUtil.toJsonObjStr(null, ResponseCode.EMPTY, "暂无数据")
                }
            } catch (e: Exception) {
                e.printStackTrace()
                GsonUtil.toJsonObjStr(null, ResponseCode.FAILED, e.message!!)
            }
        }

    @ApiOperation(value = "保存轮播图", notes = "保存轮播图")
    @PostMapping(value = ["/save"], produces = [(MediaType.APPLICATION_JSON_UTF8_VALUE)])
    @ResponseBody
    fun saveBanner(banner: Banner): Any {
        return try {
            if (this::bannerService.isInitialized) {
                val result = bannerService.insert(banner)
                if (result) GsonUtil.toJsonObjStr(null, ResponseCode.OK, "保存成功")
                else throw Exception("保存失败")
            } else throw Exception("组件初始化失败")
        } catch (e: Exception) {
            e.printStackTrace()
            GsonUtil.toJsonObjStr(null, ResponseCode.FAILED, e.message!!)
        }
    }

    @ApiOperation(value = "更新轮播图", notes = "轮播图更新")
    @PostMapping(value = ["/update"], produces = [(MediaType.APPLICATION_JSON_UTF8_VALUE)])
    @ResponseBody
    fun updateBanner(banner: Banner): Any {
        return try {
            if (this::bannerService.isInitialized) {
                val result = bannerService.updateById(banner)
                if (result) GsonUtil.toJsonObjStr(null, ResponseCode.OK, "更新成功")
                else throw Exception("更新失败，未找到该轮播图")
            } else throw Exception("组件初始化失败")
        } catch (e: Exception) {
            e.printStackTrace()
            GsonUtil.toJsonObjStr(null, ResponseCode.FAILED, e.message!!)
        }
    }

    @ApiOperation(value = "删除轮播图", notes = "轮播图删除")
    @PostMapping(value = ["/delete"], produces = [(MediaType.APPLICATION_JSON_UTF8_VALUE)])
    @ResponseBody
    fun deleteBanner(@ApiParam(required = false, value = "轮播图id")
                     @RequestParam(required = false) id: Long?): Any {
        return try {
            if (this::bannerService.isInitialized) {
                val result = bannerService.deleteById(id ?: throw Exception("该轮播图id不存在"))
                if (result) GsonUtil.toJsonObjStr(null, ResponseCode.OK, "删除成功")
                else throw Exception("删除失败，未找到该轮播图")
            } else throw Exception("组件初始化失败")
        } catch (e: Exception) {
            e.printStackTrace()
            GsonUtil.toJsonObjStr(null, ResponseCode.FAILED, e.message!!)
        }
    }

}