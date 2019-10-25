# PROJ.4 API Defnition
cdef extern from "proj_experimental.h":

    PJ *proj_create_vertical_crs(PJ_CONTEXT *ctx,
                                              const char *crs_name,
                                              const char *datum_name,
                                              const char *linear_units,
                                              double linear_units_conv)

    PJ *proj_crs_create_bound_vertical_crs(PJ_CONTEXT *ctx,
                                                const PJ* vert_crs,
                                                const PJ* hub_geographic_3D_crs,
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

    ctypedef enum PJ_ELLIPSOIDAL_CS_3D_TYPE:
        PJ_ELLPS3D_LONGITUDE_LATITUDE_HEIGHT,
        PJ_ELLPS3D_LATITUDE_LONGITUDE_HEIGHT

    PJ *proj_create_ellipsoidal_3D_cs(PJ_CONTEXT *ctx,
                                           PJ_ELLIPSOIDAL_CS_3D_TYPE type,
                                           const char* horizontal_angular_unit_name,
                                           double horizontal_angular_unit_conv_factor,
                                           const char* vertical_linear_unit_name,
                                           double vertical_linear_unit_conv_factor);

    ctypedef enum PJ_ELLIPSOIDAL_CS_2D_TYPE:
        PJ_ELLPS2D_LONGITUDE_LATITUDE,
        PJ_ELLPS2D_LATITUDE_LONGITUDE

    PJ *proj_create_ellipsoidal_2D_cs(PJ_CONTEXT *ctx,
                                                   PJ_ELLIPSOIDAL_CS_2D_TYPE type,
                                                   const char* unit_name,
                                                   double unit_conv_factor);

    PJ *proj_create_geographic_crs_from_datum(PJ_CONTEXT *ctx,
                                                const char *crs_name,
                                                PJ* datum,
                                                PJ* ellipsoidal_cs);

    PJ *proj_create_projected_crs(PJ_CONTEXT *ctx,
                                               const char* crs_name,
                                               const PJ* geodetic_crs,
                                               const PJ* conversion,
                                               const PJ* coordinate_system);

    PJ *proj_create_conversion_utm(PJ_CONTEXT *ctx,
                                    int zone,
                                    int north);

    ctypedef enum PJ_CARTESIAN_CS_2D_TYPE:
        PJ_CART2D_EASTING_NORTHING,
        PJ_CART2D_NORTHING_EASTING,
        PJ_CART2D_NORTH_POLE_EASTING_SOUTH_NORTHING_SOUTH,
        PJ_CART2D_SOUTH_POLE_EASTING_NORTH_NORTHING_NORTH,
        PJ_CART2D_WESTING_SOUTHING
    PJ *proj_create_cartesian_2D_cs(PJ_CONTEXT *ctx,
                                                 PJ_CARTESIAN_CS_2D_TYPE type,
                                                 const char* unit_name,
                                                 double unit_conv_factor);