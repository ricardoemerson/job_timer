// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_detail_state.dart';

// **************************************************************************
// MatchExtensionGenerator
// **************************************************************************

extension ProjectDetailStatusMatch on ProjectDetailStatus {
  T match<T>(
      {required T Function() initial,
      required T Function() loading,
      required T Function() success,
      required T Function() error}) {
    final v = this;
    if (v == ProjectDetailStatus.initial) {
      return initial();
    }

    if (v == ProjectDetailStatus.loading) {
      return loading();
    }

    if (v == ProjectDetailStatus.success) {
      return success();
    }

    if (v == ProjectDetailStatus.error) {
      return error();
    }

    throw Exception(
        'ProjectDetailStatus.match failed, found no match for: $this');
  }

  T matchAny<T>(
      {required T Function() any,
      T Function()? initial,
      T Function()? loading,
      T Function()? success,
      T Function()? error}) {
    final v = this;
    if (v == ProjectDetailStatus.initial && initial != null) {
      return initial();
    }

    if (v == ProjectDetailStatus.loading && loading != null) {
      return loading();
    }

    if (v == ProjectDetailStatus.success && success != null) {
      return success();
    }

    if (v == ProjectDetailStatus.error && error != null) {
      return error();
    }

    return any();
  }
}
