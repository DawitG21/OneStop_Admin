// ignore_for_file: curly_braces_in_flow_control_structures, avoid_returning_null_for_void, use_build_context_synchronously
// Projects Imports
import 'package:intl/intl.dart';
import 'package:onestopservices/models/cancellation/cancellation.dart';
import 'package:onestopservices/services/cancellation/cancellationFactory.dart';
import 'package:onestopservices/utilities/dialog_modal.dart';
import 'package:onestopservices/services/toaster_service.dart';
import 'package:onestopservices/services/variables_service.dart';
import 'package:onestopservices/themes/app_theme.dart';
import 'package:onestopservices/screens/cancellationrule/edit_cancellation.dart';
import 'package:onestopservices/widgets/general/paginator.dart';

// Flutter Iports
import 'package:flutter/material.dart';

// Package Imports
import 'package:provider/provider.dart';

class CancellationRuleTable extends StatefulWidget {
  const CancellationRuleTable({super.key});

  @override
  State<CancellationRuleTable> createState() => _CancellationRuleTableState();
}

class _CancellationRuleTableState extends State<CancellationRuleTable> {
  List<CancellationRules> cancellations = [];
  List<CancellationRules> _filteredCancellations = [];
  TextEditingController searchController = TextEditingController();

  int page = 1, pages = 1;
  CancellationFactory? fnc;
  VariableService? getProperty = VariableService();
  var searchResult = 'There are no cancellation records';
  var searchResultInvalid = 'There is no such cancellation';

  @override
  void initState() {
    getProperty!.getPermissions(context);
    super.initState();
  }

  @override
  void didChangeDependencies() async {
    if (getProperty!.isInit) {
      setState(() {
        getProperty!.isLoading = true;
      });
      fnc = Provider.of<CancellationFactory>(context, listen: false);
      await fnc!
          .getAllCancellations(fnc!.currentPage)
          .then((r) => {setVariables(fnc!)});

      setState(() {
        getProperty!.isLoading = false;
      });
      getProperty!.isInit = false;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    if (_filteredCancellations.isEmpty) {
      _filteredCancellations = cancellations;
      // cancellations =
      //     Provider.of<CancellationFactory>(context, listen: false).cancellations;
    }

    return Container(
      child: getProperty!.isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                _searchCancellationRule,
                Visibility(
                  visible: getProperty!.isVisible,
                  child: Container(
                    height: MediaQuery.of(context).size.height / 1.5,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: AppTheme.white,
                        borderRadius: BorderRadius.circular(20)),
                    padding: const EdgeInsets.all(20),
                    child: _filteredCancellations.isNotEmpty
                        ? SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            physics: const BouncingScrollPhysics(),
                            child: RefreshIndicator(
                              onRefresh: () => refreshCancellations(context),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: DataTable(
                                      columns: [
                                        const DataColumn(
                                          label: Text('Name'),
                                        ),
                                        const DataColumn(
                                          label: Text('Type'),
                                        ),
                                        const DataColumn(
                                          label: Text(
                                            'Status',
                                            style: TextStyle(
                                              color: AppTheme.defaultTextColor,
                                            ),
                                          ),
                                        ),
                                        const DataColumn(
                                          label: Text('Created'),
                                        ),
                                        DataColumn(
                                            label: Row(
                                          children: const [
                                            Text(''),
                                          ],
                                        )),
                                      ],
                                      // rows: const [],
                                      rows: List.generate(
                                        _filteredCancellations.length,
                                        (element) => DataRow(
                                          cells: [
                                            DataCell(
                                              Text(
                                                _filteredCancellations[element]
                                                    .reason!
                                                    .toUpperCase(),
                                              ),
                                            ),
                                            DataCell(
                                              _filteredCancellations[element]
                                                          .type !=
                                                      null
                                                  ? Text(
                                                      _filteredCancellations[
                                                              element]
                                                          .type
                                                          .toString()
                                                          .toUpperCase(),
                                                    )
                                                  : Text(
                                                      'For All'.toUpperCase(),
                                                    ),
                                            ),
                                            DataCell(
                                              _filteredCancellations[element]
                                                          .status !=
                                                      1
                                                  ? Tooltip(
                                                      message: 'In Active',
                                                      child: Icon(
                                                        Icons.verified_sharp,
                                                        color: AppTheme.red,
                                                      ),
                                                    )
                                                  : Tooltip(
                                                      message: 'Active',
                                                      child: Icon(
                                                        Icons.verified_sharp,
                                                        color: AppTheme.green,
                                                      ),
                                                    ),
                                            ),
                                            DataCell(
                                              Text(
                                                DateFormat('dd-MM-yyyy').format(
                                                    _filteredCancellations[
                                                            element]
                                                        .createdAt!),
                                              ),
                                            ),
                                            DataCell(Row(
                                              children: [
                                                if (getProperty!.permissions!
                                                    .where((permission) =>
                                                        permission.module ==
                                                        'Cancellation Rules')
                                                    .any((p) => p.actions!.any(
                                                        (action) => action.name!
                                                            .contains(
                                                                'create'))))
                                                  IconButton(
                                                    tooltip: 'Update',
                                                    onPressed: () {
                                                      updateCancellation(
                                                          _filteredCancellations[
                                                              element]);
                                                    },
                                                    icon: const Icon(
                                                      Icons.edit,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                if (getProperty!.permissions!
                                                    .where((permission) =>
                                                        permission.module ==
                                                        'Cancellation Rules')
                                                    .any((p) => p.actions!.any(
                                                        (action) => action.name!
                                                            .contains(
                                                                'delete')))) ...{
                                                  const VerticalDivider(),
                                                  IconButton(
                                                    tooltip: 'Delete',
                                                    onPressed: () {
                                                      delete(
                                                          _filteredCancellations[
                                                              element],
                                                          context);
                                                    },
                                                    icon: const Icon(
                                                      Icons.delete_forever,
                                                    ),
                                                  ),
                                                }
                                              ],
                                            )),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        : Center(
                            child: Text(
                              searchResult,
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                          ),
                  ),
                ),
                Visibility(
                  visible: getProperty!.isInvisible,
                  child: Container(
                    height: MediaQuery.of(context).size.height / 1.5,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: AppTheme.white,
                        borderRadius: BorderRadius.circular(20)),
                    padding: const EdgeInsets.all(20),
                    child: Center(
                      child: Text(
                        searchResultInvalid,
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ),
                  ),
                ),
                PaginationWidget(
                  page: page,
                  pages: pages,
                  previous: fnc!.isPrevious ? goPrevious : null,
                  next: fnc!.isNextable ? goNext : null,
                ),
              ],
            ),
    );
  }

  Widget get _searchCancellationRule {
    return Container(
      margin: const EdgeInsets.only(top: 10, bottom: 10),
      decoration: BoxDecoration(
        color: AppTheme.defaultTextColor,
        borderRadius: BorderRadius.circular(50),
      ),
      child: ListTile(
        leading: IconButton(
          tooltip: 'Clear Search',
          icon: Icon(
            Icons.cancel,
            color: AppTheme.main,
          ),
          onPressed: () {
            setState(() {
              clearSearch();
            });
          },
        ),
        title: Container(
          padding: const EdgeInsets.only(left: 10.0),
          decoration: BoxDecoration(
            color: AppTheme.white,
          ),
          child: TextFormField(
            style: const TextStyle(color: AppTheme.defaultTextColor),
            controller: searchController,
            decoration: const InputDecoration(
              hintText: 'Search by name or type',
              border: InputBorder.none,
            ),
          ),
        ),
        trailing: IconButton(
          tooltip: 'Click to Search',
          icon: Icon(
            Icons.search,
            color: AppTheme.main,
          ),
          onPressed: () {
            setState(() {
              searchCancellation(searchController.text);
            });
          },
        ),
      ),
    );
  }

  void setVariables(CancellationFactory fnc) {
    pages = fnc.totalPages;
    page = fnc.currentPage;
    cancellations = fnc.cancellations;
    _filteredCancellations = cancellations;
  }

  goNext() {
    fnc!.goNext().then((value) => setState(() => setVariables(fnc!)));
  }

  goPrevious() {
    fnc!.goPrevious().then((value) => setState(() => setVariables(fnc!)));
  }

  refreshCancellations(BuildContext context) async {
    await fnc!
        .getAllCancellations(fnc!.currentPage)
        .then((r) => {setVariables(fnc!)});
  }

  delete(element, ctx) async {
    final action = await ConfirmationDialog.yesAbortDialog(
        context,
        'DeleteConfirmation',
        'Are you sure you wish to delete ${element.reason.toUpperCase()} from cancellations list');
    if (action == DialogAction.yes) {
      setState(() {
        deleteCancellation(element.id, ctx);
        for (int i = 0; i < _filteredCancellations.length; i++) {
          if (_filteredCancellations[i].id == element.id) {
            setState(() {
              _filteredCancellations.remove(_filteredCancellations[i]);
            });
          }
        }
      });
    } else
      setState(() => null);
  }

  deleteCancellation(id, ctx) async {
    final response =
        await Provider.of<CancellationFactory>(context, listen: false)
            .deleteCancellation(id);
    snackBarNotification(ctx, ToasterService.successMsg);
    return response;
  }

  searchCancellation(String val) {
    getProperty!.search.searchText = val.toLowerCase();
    _filteredCancellations = cancellations
        .where(
          (cancellations) =>
              cancellations.reason!
                  .toLowerCase()
                  .contains(getProperty!.search.searchText) ||
              cancellations.type!
                  .toLowerCase()
                  .contains(getProperty!.search.searchText),
        )
        .toList();

    if (_filteredCancellations.isEmpty) {
      getProperty!.isInvisible = true;
      getProperty!.isVisible = false;
    }
  }

  clearSearch() {
    searchController.clear();
    getProperty!.search.searchText = '';
    setState(() {
      _filteredCancellations = cancellations;
      getProperty!.isInvisible = false;
      getProperty!.isVisible = true;
    });
  }

  updateCancellation(cancellations) {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => const EditCancellation(),
        transitionDuration: const Duration(seconds: 0),
        settings: RouteSettings(
          arguments: cancellations,
        ),
      ),
    );
  }
}
