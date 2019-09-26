# PROJ.4 API Defnition
cdef extern from "proj_experimental.h":

    PJ *proj_create_vertical_crs(PJ_CONTEXT *ctx,
                                              const char *crs_name,
                                              const char *datum_name,
                                              const char *linear_units,
                                              double linear_units_conv)

    PJ *proj_crs_create_bound_vertical_crs_to_WGS84(PJ_CONTEXT *ctx,
                                                        const PJ* vert_crs,
                                                        const char* grid_name)

    PJ *proj_create_compound_crs(PJ_CONTEXT *ctx,
                                        const char *crs_name,
                                        const PJ* horiz_crs,
                                        const PJ* vert_crs)

    PJ *proj_crs_create_projected_3D_crs_from_2D(PJ_CONTEXT *ctx,
                                                    const char *crs_name,
                                                    const PJ* projected_2D_crs,
                                                    const PJ* geog_3D_crs)

    PJ *proj_crs_alter_cs_linear_unit(PJ_CONTEXT *ctx,
                                               const PJ* obj,
                                               const char *linear_units,
                                               double linear_units_conv,
                                               const char *unit_auth_name,
                                               const char *unit_code);