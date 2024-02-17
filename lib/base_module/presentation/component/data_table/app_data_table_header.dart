import 'package:flutter/material.dart';
import 'package:lumiereorganics_app/base_module/domain/entity/color_scheme.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../domain/entity/app_theme_singleton.dart';
import '../../../domain/entity/translation.dart';
import '../../core/values/app_constants.dart';
import '../../util/responsive.dart';
import '../padding/app_padding.dart';
import 'app_data_table.dart';

class AppDataTableHeader extends StatefulWidget {
  final String? title;
  final List<DataTableFilter>? filters;

  final Function? onSearch;
  final Function? onAdd;
  final Function? onFilterChange;

  const AppDataTableHeader(
      {Key? key,
      required this.title,
      this.filters,
      this.onSearch,
      this.onAdd,
      this.onFilterChange})
      : super(key: key);
  @override
  _AppDataTableHeaderState createState() => _AppDataTableHeaderState();
}

class _AppDataTableHeaderState extends State<AppDataTableHeader> {
  DataTableFilter? _selectedFilter;
  final TextEditingController _searchController = TextEditingController();
  late bool isSearchExpanded;

  @override
  void initState() {
    isSearchExpanded = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppConstants.defaultPadding / 2),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedCrossFade(
              duration: const Duration(milliseconds: 300),
              crossFadeState: isSearchExpanded
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
              firstCurve: Curves.easeIn,
              secondCurve: Curves.easeIn,
              //Search box expanded
              firstChild: _buildExpandedSearchTextField(context),
              //Search box collapsed (normal)
              secondChild: _buildFirstTableHeadingRow(context),
            ),
            //second row for mobile screens
            if (Responsive.isMobile(context)) const AppPadding(dividedBy: 4),
            if (Responsive.isMobile(context)) _filterWidget()
          ],
        ),
      ),
    );
  }

  Row _buildFirstTableHeadingRow(BuildContext context) {
    return Row(
      children: [
        _buildTitle(context),
        if (widget.onAdd != null) _buildAddButton(context),
        const Spacer(),
        if (!Responsive.isMobile(context)) Expanded(child: _filterWidget()),
        if (widget.onSearch != null) _buildSearchButton(context),
      ],
    );
  }

  IconButton _buildSearchButton(BuildContext context) {
    return IconButton(
        icon: Icon(
          Icons.search_outlined,
          color: appTheme.isDark
              ? AppColorScheme.onPrimaryLight
              : Theme.of(context).colorScheme.primary,
        ),
        onPressed: () {
          setState(() {
            isSearchExpanded = true;
          });
        });
  }

  IconButton _buildAddButton(BuildContext context) {
    return IconButton(
      icon: Icon(
        MdiIcons.plusCircle,
        color: appTheme.isDark
            ? AppColorScheme.onPrimaryLight
            : Theme.of(context).colorScheme.primary,
      ),
      onPressed: () => widget.onAdd,
    );
  }

  Text _buildTitle(BuildContext context) {
    return Text(
      widget.title ?? "",
      style: Theme.of(context).textTheme.headline6!.copyWith(
            color: appTheme.isDark
                ? AppColorScheme.onPrimaryLight
                : Theme.of(context).colorScheme.primary,
          ),
    );
  }

  TextField _buildExpandedSearchTextField(BuildContext context) {
    return TextField(
      controller: _searchController,
      decoration: InputDecoration(
        labelText: translation.of('theme.search'),
        prefixIcon: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            _searchController.text = "";
            setState(() {
              isSearchExpanded = false;
            });
          },
        ),
        suffixIcon: IconButton(
          icon: Icon(
            Icons.search,
            color: Theme.of(context).colorScheme.primary,
          ),
          onPressed: () {
            // if (_searchController.text != null) {
            widget.onSearch!(_searchController.text);
            setState(() {
              _searchController.text = "";
              isSearchExpanded = false;
            });
            // }
          },
        ),
      ),
    );
  }

  Widget _filterWidget() {
    return (widget.filters == null)
        ? Container()
        : Row(
            children: [
              Icon(
                MdiIcons.filter,
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
              ),
              const AppPadding(dividedBy: 6),
              Text(
                translation.of('theme.filters'),
                style: Theme.of(context).textTheme.subtitle1,
              ),
              const AppPadding(dividedBy: 2),
              Expanded(
                  child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: BorderRadius.circular(
                    AppConstants.defaultPadding,
                  ),
                ),
                padding: const EdgeInsets.symmetric(
                    horizontal: AppConstants.defaultPadding / 2),
                child: (widget.filters == null)
                    ? Container()
                    : _buildDropdownButton(),
              ))
            ],
          );
  }

  DropdownButton<DataTableFilter> _buildDropdownButton() {
    return DropdownButton(
      value: _selectedFilter,
      isExpanded: true,
      underline: Container(),
      hint: Text(
        translation.of('theme.filterChoose'),
      ),
      onChanged: (DataTableFilter? selectedFilter) {
        widget.onFilterChange!(selectedFilter!.filterKey, selectedFilter.value);
        setState(() {
          _selectedFilter = selectedFilter;
        });
      },
      items: widget.filters!
          .map(
            (filter) => DropdownMenuItem<DataTableFilter>(
              value: filter,
              child: Text(
                filter.title!,
              ),
            ),
          )
          .toList(),
    );
  }
}
