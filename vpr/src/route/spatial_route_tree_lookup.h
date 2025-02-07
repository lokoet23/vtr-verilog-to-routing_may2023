#ifndef VPR_SPATIAL_ROUTE_TREE_LOOKUP_H
#define VPR_SPATIAL_ROUTE_TREE_LOOKUP_H
#include <vector>

#include "vpr_types.h"
#include "vtr_ndmatrix.h"

#include "netlist.h"
#include "route_tree_type.h"

typedef vtr::Matrix<std::vector<t_rt_node*>> SpatialRouteTreeLookup;

SpatialRouteTreeLookup build_route_tree_spatial_lookup(const Netlist<>& net_list,
                                                       const vtr::vector<ParentNetId, t_bb>& net_bound_box,
                                                       ParentNetId net,
                                                       t_rt_node* rt_root);

void update_route_tree_spatial_lookup_recur(t_rt_node* rt_node, SpatialRouteTreeLookup& spatial_lookup);

size_t grid_to_bin_x(size_t grid_x, const SpatialRouteTreeLookup& spatial_lookup);
size_t grid_to_bin_y(size_t grid_y, const SpatialRouteTreeLookup& spatial_lookup);

bool validate_route_tree_spatial_lookup(t_rt_node* rt_root, const SpatialRouteTreeLookup& spatial_lookup);

#endif
