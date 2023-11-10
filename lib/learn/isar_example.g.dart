// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'isar_example.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetMyIsarCollectionCollection on Isar {
  IsarCollection<MyIsarCollection> get myIsarCollections => this.collection();
}

const MyIsarCollectionSchema = CollectionSchema(
  name: r'MyIsarCollection',
  id: -7900091837785765916,
  properties: {
    r'costs': PropertySchema(
      id: 0,
      name: r'costs',
      type: IsarType.long,
    ),
    r'name': PropertySchema(
      id: 1,
      name: r'name',
      type: IsarType.string,
    )
  },
  estimateSize: _myIsarCollectionEstimateSize,
  serialize: _myIsarCollectionSerialize,
  deserialize: _myIsarCollectionDeserialize,
  deserializeProp: _myIsarCollectionDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _myIsarCollectionGetId,
  getLinks: _myIsarCollectionGetLinks,
  attach: _myIsarCollectionAttach,
  version: '3.1.0+1',
);

int _myIsarCollectionEstimateSize(
  MyIsarCollection object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.name.length * 3;
  return bytesCount;
}

void _myIsarCollectionSerialize(
  MyIsarCollection object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.costs);
  writer.writeString(offsets[1], object.name);
}

MyIsarCollection _myIsarCollectionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = MyIsarCollection(
    costs: reader.readLong(offsets[0]),
    name: reader.readString(offsets[1]),
  );
  object.id = id;
  return object;
}

P _myIsarCollectionDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _myIsarCollectionGetId(MyIsarCollection object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _myIsarCollectionGetLinks(MyIsarCollection object) {
  return [];
}

void _myIsarCollectionAttach(
    IsarCollection<dynamic> col, Id id, MyIsarCollection object) {
  object.id = id;
}

extension MyIsarCollectionQueryWhereSort
    on QueryBuilder<MyIsarCollection, MyIsarCollection, QWhere> {
  QueryBuilder<MyIsarCollection, MyIsarCollection, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension MyIsarCollectionQueryWhere
    on QueryBuilder<MyIsarCollection, MyIsarCollection, QWhereClause> {
  QueryBuilder<MyIsarCollection, MyIsarCollection, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<MyIsarCollection, MyIsarCollection, QAfterWhereClause>
      idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<MyIsarCollection, MyIsarCollection, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<MyIsarCollection, MyIsarCollection, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<MyIsarCollection, MyIsarCollection, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension MyIsarCollectionQueryFilter
    on QueryBuilder<MyIsarCollection, MyIsarCollection, QFilterCondition> {
  QueryBuilder<MyIsarCollection, MyIsarCollection, QAfterFilterCondition>
      costsEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'costs',
        value: value,
      ));
    });
  }

  QueryBuilder<MyIsarCollection, MyIsarCollection, QAfterFilterCondition>
      costsGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'costs',
        value: value,
      ));
    });
  }

  QueryBuilder<MyIsarCollection, MyIsarCollection, QAfterFilterCondition>
      costsLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'costs',
        value: value,
      ));
    });
  }

  QueryBuilder<MyIsarCollection, MyIsarCollection, QAfterFilterCondition>
      costsBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'costs',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<MyIsarCollection, MyIsarCollection, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<MyIsarCollection, MyIsarCollection, QAfterFilterCondition>
      idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<MyIsarCollection, MyIsarCollection, QAfterFilterCondition>
      idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<MyIsarCollection, MyIsarCollection, QAfterFilterCondition>
      idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<MyIsarCollection, MyIsarCollection, QAfterFilterCondition>
      nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MyIsarCollection, MyIsarCollection, QAfterFilterCondition>
      nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MyIsarCollection, MyIsarCollection, QAfterFilterCondition>
      nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MyIsarCollection, MyIsarCollection, QAfterFilterCondition>
      nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MyIsarCollection, MyIsarCollection, QAfterFilterCondition>
      nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MyIsarCollection, MyIsarCollection, QAfterFilterCondition>
      nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MyIsarCollection, MyIsarCollection, QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MyIsarCollection, MyIsarCollection, QAfterFilterCondition>
      nameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MyIsarCollection, MyIsarCollection, QAfterFilterCondition>
      nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<MyIsarCollection, MyIsarCollection, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }
}

extension MyIsarCollectionQueryObject
    on QueryBuilder<MyIsarCollection, MyIsarCollection, QFilterCondition> {}

extension MyIsarCollectionQueryLinks
    on QueryBuilder<MyIsarCollection, MyIsarCollection, QFilterCondition> {}

extension MyIsarCollectionQuerySortBy
    on QueryBuilder<MyIsarCollection, MyIsarCollection, QSortBy> {
  QueryBuilder<MyIsarCollection, MyIsarCollection, QAfterSortBy> sortByCosts() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'costs', Sort.asc);
    });
  }

  QueryBuilder<MyIsarCollection, MyIsarCollection, QAfterSortBy>
      sortByCostsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'costs', Sort.desc);
    });
  }

  QueryBuilder<MyIsarCollection, MyIsarCollection, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<MyIsarCollection, MyIsarCollection, QAfterSortBy>
      sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }
}

extension MyIsarCollectionQuerySortThenBy
    on QueryBuilder<MyIsarCollection, MyIsarCollection, QSortThenBy> {
  QueryBuilder<MyIsarCollection, MyIsarCollection, QAfterSortBy> thenByCosts() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'costs', Sort.asc);
    });
  }

  QueryBuilder<MyIsarCollection, MyIsarCollection, QAfterSortBy>
      thenByCostsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'costs', Sort.desc);
    });
  }

  QueryBuilder<MyIsarCollection, MyIsarCollection, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<MyIsarCollection, MyIsarCollection, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<MyIsarCollection, MyIsarCollection, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<MyIsarCollection, MyIsarCollection, QAfterSortBy>
      thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }
}

extension MyIsarCollectionQueryWhereDistinct
    on QueryBuilder<MyIsarCollection, MyIsarCollection, QDistinct> {
  QueryBuilder<MyIsarCollection, MyIsarCollection, QDistinct>
      distinctByCosts() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'costs');
    });
  }

  QueryBuilder<MyIsarCollection, MyIsarCollection, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }
}

extension MyIsarCollectionQueryProperty
    on QueryBuilder<MyIsarCollection, MyIsarCollection, QQueryProperty> {
  QueryBuilder<MyIsarCollection, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<MyIsarCollection, int, QQueryOperations> costsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'costs');
    });
  }

  QueryBuilder<MyIsarCollection, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }
}
